require 'rails_helper'

feature 'profile page' do
  scenario 'user can visit the profile page via topbar link' do
    login_with_facebook("Hanibal")
    click_link "Profile"

    expect(page).to have_content("Hanibal's Account")
  end
  scenario 'user can see information about their account on the profile page' do
    login_with_facebook("Hanibal")
    hanibal = User.where(name: "Hanibal").first
    FactoryGirl.create(:dvd, user: hanibal, title: "Breakfast at Tiffany's")
    FactoryGirl.create(:dvd, user: hanibal, title: "How the West Was Won")
    FactoryGirl.create(:dvd, user: hanibal, title: "The Blue Max")
    FactoryGirl.create(:user_household_member, user: hanibal, household_member_name: "Face")
    FactoryGirl.create(:user_household_member, user: hanibal, household_member_name: "B.A.")
    FactoryGirl.create(:user_household_member, user: hanibal, household_member_name: "Murdock")
    click_link "Profile"

    expect(page).to have_content("Number of DVDs: 3")
    expect(page).to have_content("Face")
    expect(page).to have_content("B.A.")
    expect(page).to have_content("Murdock")
  end
end
