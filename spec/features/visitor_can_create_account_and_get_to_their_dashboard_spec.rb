require "rails_helper"

RSpec.feature "visitor creates an account" do
  context "with valid attributes" do
    scenario "visitor creates new account and is redirected" do
      visit login_path
      click_button "Create Account"

      fill_in "Name", with: "Bob"
      fill_in "Username", with: "Username"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create Account"

      expect(current_path).to eq("/dashboard")

      within "nav" do
        expect(page).to have_content("Logged in as Bob")
      end

      expect(page).to have_button("Orders")
      expect(page).to have_content("So your dryer played you... Bob, you've come to the right place.")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end
  end

  context "password confirmation does not match password" do
    scenario "receive flash about not matching and brought back to new user form" do
      visit login_path
      click_button "Create Account"

      fill_in "Name", with: "Bob"
      fill_in "Username", with: "Username"
      fill_in "Password", with: "Not_password"
      fill_in "Password confirmation", with: "Password"
      click_on "Create Account"

      expect(page).to have_content("Password confirmation doesn't match Password")
      expect(page).to_not have_content("Logout")
    end
  end
end
