require "rails_helper"

feature "user edits a dvd", vcr: true do
  before(:each) do
    user_adds_dvd
    click_link "The Terminator"
    click_link "Edit"
  end

  scenario "user can get to edit page from the show" do
    expect(page).to have_content "Edit The Terminator"
  end

  scenario "form renders with fields populated with current properties" do
    expect(find_field("Title").value).to eq "The Terminator"
    expect(find_field("Director").value).to eq "James Cameron"
  end

  scenario "user can succesfully edit a dvd" do
    fill_in "User rating", with: "5"
    click_button "Edit DVD"

    expect(page).to have_content "Edits Saved"
    expect(page).to have_content "User Rating: 5"
  end

  scenario "User leaves Title blank" do
    fill_in "Title", with: ""
    click_button "Edit DVD"

    expect(page).to have_content "Edit The Terminator"
    expect(page).to have_content "Title can't be blank"
    expect(find_field("Title").value).to eq ""
  end
end
