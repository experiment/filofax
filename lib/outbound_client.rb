class OutboundClient
  include HTTParty
  base_uri 'http://outbound.experiment.com/api'
  headers 'Authentication-Header' => ENV['OUTBOUND_AUTHENTICATION_HEADER']

  def create_contact(author)
    params = {
      source: 'filofax',
      contact: {
        email: author.email,
        name: author.name,
        info: {
          journal: author.paper.journal.name,
          paper: {
            published_at: author.paper.published_at
          }
        }
      }
    }
    response = self.class.post '/contacts', query: params

    unless response.code == 201
      raise "OutboundClient#create_contact: #{response.code.to_s}"
    end
  end
end
