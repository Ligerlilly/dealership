require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'dealership path', { type: :feature } do
  it 'has links to dealerships and add new dealership' do
    visit '/'
    expect(page).to have_content "Welcome to Dealership Central See Dealership List Add New Dealership"
  end
end
