module Papers
  class ScrapeWorker
    include Sidekiq::Worker

    # Currently not retrying
    # sidekiq_retry_in do |count|
    #   86400 * count # always retry in 1 day
    # end

    sidekiq_options throttle: { threshold: 1, period: 30.seconds },
      :retry => false

    def perform(paper_id)
      paper = Paper.find paper_id

      paper.scrape!
    end
  end
end
