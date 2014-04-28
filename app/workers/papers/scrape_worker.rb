module Papers
  class ScrapeWorker
    include Sidekiq::Worker

    def perform(paper_id)
      paper = Paper.find paper_id

      paper.scrape!
    end
  end
end
