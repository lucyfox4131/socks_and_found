require "rails_helper"

RSpec.feature "visitor creates an account" do
  pending
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
        #expect page to have profile information!
      end

      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end
  end
end
