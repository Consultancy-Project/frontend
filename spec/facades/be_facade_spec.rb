require 'rails_helper'

RSpec.describe 'BE Facade' do
  describe 'get_news' do
    it 'returns an array of news articles', :vcr do
      
      articles = BeFacade.get_news

      expect(articles.class).to eq(Array)
      expect(articles.first.headline).to be_a String
      expect(articles.first.url).to be_a String
      expect(articles.first.image).to be_a String
      expect(articles.first.summary).to be_a String
    end
  end

  describe 'get_tweets' do
    it 'returns an array of tweets', :vcr do
      tweets = BeFacade.get_tweets

      expect(tweets.class).to eq(Array)
      expect(tweets.first.tweet).to be_a String
      expect(tweets.first.username).to be_a String
    end
  end
end