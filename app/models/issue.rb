class Issue < ActiveRecord::Base
  belongs_to :journal
  has_many :papers
  has_many :authors, through: :papers

  validates :url, presence: true, uniqueness: true

  # TODO, add re-scrape protection

  def scrape!
    scraper.scrape!

    scraper.papers.each do |paper|
      papers.create! url: paper.url
    end
  end

  private

    def scraper
      # TODO, make work for non BMC journals
      @scraper ||= Journals::BmcIssue.new url: url
    end
end
