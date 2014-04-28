class Issue < ActiveRecord::Base
  belongs_to :journal
  has_many :papers
  has_many :authors, through: :papers

  validates :url, presence: true, uniqueness: true

  scope :unscraped, -> { where(scraped: false) }

  def scrape!
    return if scraped?

    scraper.scrape!

    Issue.transaction do
      scraper.papers.each do |paper|
        if paper.doi
          papers.create! doi: paper.doi
        else
          papers.create! url: paper.url
        end
      end

      self.scraped = true
      save!
    end
  end

  private

    def scraper
      # TODO, make this logic better for more journals
      @scraper ||= case journal.name
        when /^PLOS/
          Journals::PlosIssue.new url: url
        else
          Journals::BmcIssue.new url: url
      end
    end
end
