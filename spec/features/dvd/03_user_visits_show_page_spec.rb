require "rails_helper"

feature "user visits show page", vcr: true do
  scenario "user can get to show page from index" do
    user_adds_dvd
    click_link "The Terminator"

    expect(page).to have_content "The Terminator"
    expect(page).to have_content "Arnold Schwarzenegger"
    expect(page).to have_content "James Cameron"
    expect(page).to have_content "James Cameron"
    expect(page).to have_content "2014-08-26"
  end
end
