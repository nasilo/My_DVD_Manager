require 'rails_helper'

feature 'Sign in' do
  scenario 'a new user signs up' do
    login_with_facebook("Test_User")

    expect(page).to have_content "Your DVDs"
  end
  scenario 'an existing user signs in' do
    login_with_facebook("Test_User")
    click_link 'Sign Out'
    visit auth_path(:facebook)

    expect(page).to have_content "Your DVDs"
  end
end
