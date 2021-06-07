require 'rails_helper'

RSpec.describe 'tweet poro' do
  it 'has readable attributes' do
    tweets_json = File.read('spec/fixtures/tweets.json')
    data_hash = JSON.parse(tweets_json, symbolize_names: true)
    tweet = Tweet.new(data_hash[:data].first)
    expect(tweet.class).to eq(Tweet)
    expect(tweet.tweet).to be_a String
    expect(tweet.username).to be_a String
  end
end