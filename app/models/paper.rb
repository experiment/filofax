class Paper < ActiveRecord::Base
  belongs_to :issue
  has_many :authors

  validates :issue, presence: true

  def scrape!
    return if scraped?

    Timeout::timeout(30) do
      scraper.scrape!
    end

    if scraper.title && scraper.author # Basic sanity check
      Paper.transaction do
        self.doi = scraper.doi
        self.title = scraper.title
        self.published_at = scraper.published_at
        self.keywords = scraper.keywords

        authors.create! do |author|
          author.name = scraper.author.name
          author.email = scraper.author.email
          author.location = scraper.author.location
        end

        self.scraped = true
        save!
      end
    end
  end

  private

    def scraper
      # TODO, make work for non BMC journals
      @scraper ||= Journals::BmcPaper.new url: url
    end
end
