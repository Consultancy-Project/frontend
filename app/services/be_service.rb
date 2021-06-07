class BeService
  class << self
    def recent_tweets
      resp = conn.get("tweets")
      parse_json(resp)
    end
    
    def recent_news
      resp = conn.get("news")
      parse_json(resp)
    end

    private 
    
    def conn
      Faraday.new(url: 'https://be2102-consultancy-project-be.herokuapp.com/api/v1/')
    end
    
    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
