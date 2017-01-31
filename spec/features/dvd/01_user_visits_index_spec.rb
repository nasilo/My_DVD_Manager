require "rails_helper"

feature "user visits index page" do
  scenario "user can see list of their dvds" do
    FactoryGirl.create(:dvd, title: "Space Balls")
    FactoryGirl.create(:dvd, title: "Young Frankenstein")
    FactoryGirl.create(:dvd, title: "Silent Movie")
    visit dvds_path
    expect(page).to have_content "Your DVDs"

    expect(page).to have_content "Space Balls"
    expect(page).to have_content "Silent Movie"
    expect(page).to_not have_content "Rambo"
  end
end
