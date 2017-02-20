require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New user"
  end

  feature "signing up a user" do

    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'Hyun'
      fill_in 'password', with: 'password123'
      click_on 'Create User'
    end
    scenario "shows username on the homepage after signup" do
      expect(page).to have_content 'Hyun'
    end
  end
end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    User.create(username: 'Hyun', password: 'password123')
    visit new_session_url
    fill_in 'username', with: 'Hyun'
    fill_in 'password', with: 'password123'
    click_on 'Log In'
    expect(page).to have_content 'Hyun'
  end

end

feature "logging out" do

  scenario "begins with a logged out state" do
    visit new_session_url
    expect(page).to have_content "Log In"
  end

  scenario "doesn't show username on the homepage after logout" do
    User.create(username: 'Hyun', password: 'password123')
    visit new_session_url
    fill_in 'username', with: 'Hyun'
    fill_in 'password', with: 'password123'
    click_on('Log In')
    click_on('Log Out')
    expect(page).not_to have_content 'Hyun'
  end

end
