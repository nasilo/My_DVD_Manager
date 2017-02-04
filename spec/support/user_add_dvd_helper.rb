module UserAddsDvdHelper
  def user_adds_dvd(username = "foobington", upc = "027616854735")
    login_with_facebook(username)
    visit new_dvd_path
    fill_in "Upc", with: upc
    click_button "Search UPC"
    click_button "Add DVD"
  end
end
