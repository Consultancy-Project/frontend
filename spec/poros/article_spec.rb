require 'rails_helper'

RSpec.describe 'article poro' do
  it 'has readable attributes' do
    articles_json = File.read('spec/fixtures/news.json')
    data_hash = JSON.parse(articles_json, symbolize_names: true)
    article = Article.new(data_hash[:data].first)
    expect(article.class).to eq(Article)
    expect(article.headline).to be_a String
    expect(article.url).to be_a String
  end
end