require "rails_helper"

RSpec.feature "visitor creates an account" do
  context "with valid attributes" do
    scenario "visitor creates new account and is redirected" do
      visit login_path
      click_link "Create Account"

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
      expect(page).to have_content("So your dryer played you! You've come to the right place.")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end
  end
end
