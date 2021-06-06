require 'rails_helper'

RSpec.describe 'user dashboard' do
  before :each do |test|
    @user = User.create!(name: 'test_user')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user) unless test.metadata[:logged_out]
  end

  it 'displays three news articles with headlines and links to articles' do
    visit dashboard_path
    save_and_open_page
  end

  xit 'displays three tweets' do
  end

  xit 'does not allow a user who is not logged in to view page', :logged_out do
  end
end