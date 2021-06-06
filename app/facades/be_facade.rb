class BeFacade
  class << self
    def get_news
      articles_json = BeService.recent_news
      articles = articles_json[:data].map do |article|
        Article.new(article)
      end
      articles
    end

    def get_tweets
      tweets_json = BeService.recent_tweets
      tweets = tweets_json[:data].map do |tweet|
        Tweet.new(tweet)
      end
      tweets
    end
  end
end