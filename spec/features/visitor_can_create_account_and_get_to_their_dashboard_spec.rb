require "rails_helper"

RSpec.feature "visitor creates an account" do
  context "with valid attributes" do
    scenario "visitor creates new account and is redirected" do
      visit "/login"

      click_link "Create Account"

      fill_in :name, with: "Bob"
      fill_in :username, with: "username"
      fill_in :password, with: "password"
      click_on "Create New Account"

      expect(current_path).to eq("/dashbaord")

      within "nav" do
        expect(page).to have_content("Logged in as Bob")
        #expect page to have profile information!
      end

      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end
  end
end
