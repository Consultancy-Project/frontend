require 'rails_helper'

RSpec.describe 'Welcome page' do
  it 'has a button to login with github' do
    visit root_path
    expect(page).to have_button("Login with Github")
  end
end