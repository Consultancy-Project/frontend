require 'rails_helper'

RSpec.describe 'user dashboard' do
  before :each do |test|
    @user = User.create!(name: 'test_user')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user) unless test.metadata[:logged_out]
  end

  it 'displays three news articles with headlines and links to articles' do
    news_response = File.read('spec/fixtures/news.json')
    twitter_response = File.read('spec/fixtures/tweets.json')

    stub_request(:get, "https://localhost:3000/tweets")
    .with(
      headers: {
                'Accept'=>'*/*',
                'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'User-Agent'=>'Faraday v1.4.2'
                })
    .to_return(status: 200, body: twitter_response, headers: {})

    stub_request(:get, "https://localhost:3000/news")
    .with(
      headers: {
                'Accept'=>'*/*',
                'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'User-Agent'=>'Faraday v1.4.2'
                })
    .to_return(status: 200, body: news_response, headers: {})

    visit dashboard_path
    
    within("#news") do
      expect(page).to have_content("El Salvador becomes the world's first country to adopt bitcoin as legal tender")
      expect(page).to have_content("This SF couple moved from a studio to a $3,850-per-month luxury 1-bedroom: Why they decided to 'splurge'")
      expect(page).to have_content("NBA's Portland Trail Blazers face mounting concerns after first-round exit and a coaching change")
  
      expect(page).to have_content("https://www.cnbc.com/2021/06/05/el-salvador-becomes-the-first-country-to-adopt-bitcoin-as-legal-tender-.html")
      expect(page).to have_content("https://www.cnbc.com/2021/06/05/inside-a-3850-per-month-luxury-one-bedroom-apartment-in-san-francisco.html")
      expect(page).to have_content("https://www.cnbc.com/2021/06/05/trail-blazers-face-mounting-concerns-following-playoff-exit-coaching-change.html")
    end

    within("#twitter") do
      expect(page).to have_content("it's so crazy that it seems crypto has entirely lost its meaning as a transactional currency and is now basically just stocks 2")
      expect(page).to have_content("RT @Callum_Thomas: 8. Value in commodity stocks @jessefelder https://t.co/QvBJlBIYHo")
      expect(page).to have_content("#StockNews #TopStories NYSE V EVP Has Sold Close To $2,948,279 In Stocks: The EVP of NYSE V, Kelly Mahon has reportedly sold close to 12,735 shares of the company stocks in a 2nd June transaction. The average price at which these stocks were sold is… https://t.co/1mRRKiFmg7")
    end
  end

  it 'does not allow a user who is not logged in to view page', :logged_out do
    expect{ visit dashboard_path }.to raise_error(ActionController::RoutingError)
  end
end