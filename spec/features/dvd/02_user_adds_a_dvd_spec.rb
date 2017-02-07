require "rails_helper"

feature "user adds a DVD", vcr: true do
  scenario "user can populate the form with a upc" do
    login_with_facebook("New_User")
    visit new_dvd_path
    fill_in "UPC", with: "027616854735"
    click_button "Search UPC"

    expect(find_field("Title").value).to eq "The Terminator"
    expect(find_field("MPAA Rating").value).to eq "R (Restricted)"
    expect(find_field("Director").value).to eq "James Cameron"
    expect(find_field("Run time").value).to eq "107 minutes"
  end
  scenario "user can add a dvd with a upc" do
    login_with_facebook("New_User")
    visit new_dvd_path
    fill_in "UPC", with: "027616854735"
    click_button "Search UPC"
    click_button("Add DVD")

    expect(page).to have_content "The Terminator"
  end
end
