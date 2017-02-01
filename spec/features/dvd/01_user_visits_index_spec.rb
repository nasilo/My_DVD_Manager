require "rails_helper"

feature "user visits index page" do
  scenario "user can see list of their dvds" do
    login_with_facebook("New_User")
    nu = User.where(name: "New_User").first
    FactoryGirl.create(:dvd,user: nu, title: "Space Balls")
    FactoryGirl.create(:dvd,user: nu, title: "Young Frankenstein")
    FactoryGirl.create(:dvd,user: nu, title: "Silent Movie")

    click_link 'Sign Out'
    visit auth_path(:facebook)

    expect(page).to have_content "Your DVDs"

    expect(page).to have_content "Space Balls"
    expect(page).to have_content "Silent Movie"
    expect(page).to_not have_content "Rambo"
  end

  scenario "users don't see other people's dvds" do
    other_user = FactoryGirl.create(:user)
    FactoryGirl.create(:dvd, user: other_user, title: "Space Balls")
    FactoryGirl.create(:dvd, user: other_user, title: "Young Frankenstein")
    FactoryGirl.create(:dvd, user: other_user, title: "Silent Movie")
    login_with_facebook("user")

    expect(page).to_not have_content "Space Balls"
    expect(page).to_not have_content "Silent Movie"
    expect(page).to_not have_content "Young Frankenstein"
  end
end
