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
      doi = scraper.doi
      title = scraper.title
      published_at = scraper.published_at
      keywords = scraper.keywords
      authors.create! do |author|
        author.name = scraper.author.name
        author.email = scraper.author.email
        author.location = scraper.author.location
      end
      scraped = true
      save!
    end
  end

  private

    def scraper
      # TODO, make work for non BMC journals
      @scraper ||= Journals::BmcPaper.new url: url
    end
end
