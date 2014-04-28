class Paper < ActiveRecord::Base
  belongs_to :issue
  has_many :authors

  validates :issue, presence: true

  after_commit :enqueue_scrape, on: :create

  scope :unscraped, -> { where(scraped: false) }

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
      # TODO, make this logic better for more journals
      @scraper ||= case journal.name
        when /^PLOS/
          Journals::PlosPaper.new doi: doi
        else
          Journals::BmcPaper.new url: url
      end
    end

    def enqueue_scrape
      Papers::ScrapeWorker.perform_async id
    end
end
