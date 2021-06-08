require 'rails_helper'

RSpec.describe 'article poro', :vcr do
  it 'has readable attributes' do
    data = BeService.recent_news
    article = Article.new(data[:data].first)
    expect(article.class).to eq(Article)
    expect(article.headline).to be_a String
    expect(article.url).to be_a String
    expect(article.image).to be_a String
    expect(article.summary).to be_a String
  end
end