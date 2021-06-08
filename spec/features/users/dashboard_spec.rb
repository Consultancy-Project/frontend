require 'rails_helper'

RSpec.describe 'user dashboard' do
  before :each do |test|
    @user = User.create!(name: 'test_user')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user) unless test.metadata[:logged_out]
  end

  it 'does not allow a user who is not logged in to view page', :logged_out do
    expect{ visit dashboard_path }.to raise_error(ActionController::RoutingError)
  end

  xit 'does not allow a user who logged out to view the dashboard' do
    visit dashboard_path
    click_link "Logout"
    expect(current_path).to eq(dashboard_path)

    visit dashboard_path
    expect{ visit dashboard_path }.to raise_error(ActionController::RoutingError)
  end
end