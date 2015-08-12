require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'dealership path', { type: :feature } do
  it 'has links to dealerships and add new dealership' do
    visit '/'
    expect(page).to have_content "Welcome to Dealership Central See Dealership List Add New Dealership"
  end

  it 'has working links' do
    visit '/'
    click_link 'See Dealership List'
    expect(page).to have_content 'Dealership List'
    click_link 'back'
    click_link 'Add New Dealership'
    expect(page).to have_content 'Submit'
  end
end
