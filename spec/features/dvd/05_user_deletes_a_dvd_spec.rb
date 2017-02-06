require "rails_helper"

feature "user deletes a dvd" do
  scenario "user can delete a dvd from the show page" do
    login_with_facebook("New_User")
    nu = User.where(name: "New_User").first
    FactoryGirl.create(:dvd,user: nu, title: "Space Balls")
    FactoryGirl.create(:dvd,user: nu, title: "Young Frankenstein")
    FactoryGirl.create(:dvd,user: nu, title: "Silent Movie")
    click_link 'Sign Out'
    visit auth_path(:facebook)

    click_link "Space Balls"
    click_link "Delete"

    expect(page).to have_content "New_User's DVDs"
    expect(page).to have_content "Silent Movie"
    expect(page).to_not have_content "Space Balls"
  end

  scenario "user can delete a dvd from the edit page" do
    login_with_facebook("New_User")
    nu = User.where(name: "New_User").first
    FactoryGirl.create(:dvd,user: nu, title: "Space Balls")
    FactoryGirl.create(:dvd,user: nu, title: "Young Frankenstein")
    FactoryGirl.create(:dvd,user: nu, title: "Silent Movie")
    click_link 'Sign Out'
    visit auth_path(:facebook)

    click_link "Space Balls"
    click_link "Edit"
    click_link "Delete"

    expect(page).to have_content "New_User's DVDs"
    expect(page).to_not have_content "Space Balls"
    expect(page).to have_content "Silent Movie"
  end
end
