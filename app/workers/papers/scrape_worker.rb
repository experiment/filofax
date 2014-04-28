module Papers
  class ScrapeWorker
    include Sidekiq::Worker

    def perform(paper_id)
      paper = Paper.find paper_id

      paper.scrape!
    ensure
      sleep rand(15)
    end
  end
end
