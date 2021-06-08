require 'rails_helper'

RSpec.describe 'BE Facade' do
  describe 'get_news' do
    it 'returns an array of news articles', :vcr do
      # news_response = File.read('spec/fixtures/news.json')

      # stub_request(:get, "https://be2102-consultancy-project-be.herokuapp.com/api/v1/news")
      # .with(
      #   headers: {
      #             'Accept'=>'*/*',
      #             'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #             'User-Agent'=>'Faraday v1.4.2'
      #             })
      # .to_return(status: 200, body: news_response, headers: {})
      
      articles = BeFacade.get_news

      expect(articles.class).to eq(Array)
      expect(articles.first.headline).to be_a String
      expect(articles.first.url).to be_a String
      expect(articles.first.image).to be_a String
      expect(articles.first.summary).to be_a String
    end
  end

  describe 'get_tweets' do
    it 'returns an array of news articles' do
      twitter_response = File.read('spec/fixtures/tweets.json')

      stub_request(:get, "https://be2102-consultancy-project-be.herokuapp.com/api/v1/tweets")
      .with(
        headers: {
                  'Accept'=>'*/*',
                  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                  'User-Agent'=>'Faraday v1.4.2'
                  })
      .to_return(status: 200, body: twitter_response, headers: {})

      tweets = BeFacade.get_tweets

      expect(tweets.class).to eq(Array)
      expect(tweets.first.tweet).to be_a String
      expect(tweets.first.username).to be_a String
    end
  end
end