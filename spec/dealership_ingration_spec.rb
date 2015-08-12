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

describe 'individual dealership', { type: :feature } do
  it 'can add an indiviual dealership' do
    visit '/'
    click_link 'Add New Dealership'
    fill_in 'dealership', with: 'hi'
    click_button 'Submit'
    expect(page).to have_content 'hi'
    click_link 'hi'
    expect(page).to have_content 'Add a new vehicle'
    click_link 'Add a new vehicle'
    fill_in 'make', with: "Toyota"
    fill_in 'model', with: "Prius"
    fill_in 'year', with: "2000"
    click_button 'Add Vehicle'
    expect(page).to have_content "Toyota Prius 2000"
    click_link "Toyota Prius 2000"
    expect(page).to have_content "Car"

  end
end
