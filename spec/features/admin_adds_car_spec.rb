require 'rails_helper'

feature 'admin adds a car', %Q{
  As an admin
  I want to add a new car listing
  So that interested customers can inquire
} do

  # Acceptance Criteria
  #
  # * I must specify a make, model, year, price, color, and an
  #   optional description
  # * I must be an admin to create car listings
  # * If I am not an admin and I attempt to create a car listing, my
  #   access is denied

  scenario 'admin attempts to add a valid car listing' do
    admin = FactoryGirl.create(:admin_user)

    sign_in_as(admin)

    visit new_admin_car_path

    fill_in 'Make', with: 'Audi'
    fill_in 'Model', with: 'A6'
    fill_in 'Year', with: '2014'
    fill_in 'Price', with: '35000'
    fill_in 'Color', with: 'Green'

    click_button 'Create Car'

    expect(page).to have_content('Car created.')
    visit cars_path
    expect(page).to have_content('Audi')
  end

  scenario 'admin adds an invalid car listing' do
    admin = FactoryGirl.create(:admin_user)

    sign_in_as(admin)

    visit new_admin_car_path
    click_button 'Create Car'

    expect(page).to have_content("can't be blank")
  end

  scenario 'a standard user attempt add a valid car listing' do
    sign_in_as(FactoryGirl.create(:user))

    visit new_admin_car_path

    expect(page).to have_content('Access denied.')
    expect(page).to have_content('Car Listing')
  end

  scenario 'an unauthenticated visitor attempts to add a car listing' do
    visit new_admin_car_path

    expect(page).to have_content('Access denied.')
    expect(page).to have_content('Car Listing')
  end

  def sign_in_as(user)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')
  end
end
