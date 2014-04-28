module Papers
  class ScrapeWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count|
      86400 * count # always retry in 1 day
    end

    def perform(paper_id)
      paper = Paper.find paper_id

      paper.scrape!
    ensure
      sleep rand(15)
    end
  end
end
