require 'rails_helper'

RSpec.describe 'tweet poro', :vcr do
  it 'has readable attributes' do
    data = BeService.recent_tweets
    tweet = Tweet.new(data[:data].first)
    expect(tweet.class).to eq(Tweet)
    expect(tweet.tweet).to be_a String
    expect(tweet.username).to be_a String
  end
end