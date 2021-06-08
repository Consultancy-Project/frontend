require 'rails_helper'

RSpec.describe 'Backend service', :vcr do
  describe 'recent tweets' do
    it 'returns an array of three tweets' do
      tweets = BeService.recent_tweets

      expect(tweets[:data].count).to eq(3)
      expect(tweets[:data].first.keys).to eq([:id, :type, :attributes])
      expect(tweets[:data].first[:id]).to be_a String
      expect(tweets[:data].first[:type]).to be_a String
      expect(tweets[:data].first[:attributes]).to be_a Hash
      expect(tweets[:data].first[:attributes][:tweet]).to be_a String
    end
  end
  
  describe 'recent news' do
    it 'returns an array of three news article headlines and links' do
      articles = BeService.recent_news

      expect(articles[:data].count).to eq(3)
      expect(articles[:data].first.keys).to eq([:id, :type, :attributes])
      expect(articles[:data].first[:id]).to be_a String
      expect(articles[:data].first[:type]).to be_a String
      expect(articles[:data].first[:attributes]).to be_a Hash
      expect(articles[:data].first[:attributes].keys).to eq([:headline, :url, :image, :summary])
      expect(articles[:data].first[:attributes][:headline]).to be_a String
      expect(articles[:data].first[:attributes][:url]).to be_a String
      expect(articles[:data].first[:attributes][:image]).to be_a String
      expect(articles[:data].first[:attributes][:summary]).to be_a String
    end
  end
end