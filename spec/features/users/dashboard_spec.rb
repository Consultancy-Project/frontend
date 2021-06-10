require 'rails_helper'

RSpec.describe 'user dashboard' do
  before :each do |test|
    @user = User.create!(name: 'test_user')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user) unless test.metadata[:logged_out]
  end

  it 'does not allow a user who is not logged in to view page', :logged_out do
    expect{ visit dashboard_path }.to raise_error(ActionController::RoutingError)
  end

  it 'allows a user to log out' do
    visit dashboard_path
    click_link "Logout"
    expect(current_path).to eq(root_path)
  end
end