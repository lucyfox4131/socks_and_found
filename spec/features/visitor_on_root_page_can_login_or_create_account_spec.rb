require "rails_helper"

RSpec.feature "visitor sees login and new account links" do
  scenario "visitor visits root page" do
    visit "/"

    expect(page).to have_link("Login")
    click_link "Login"

    expect(current_path).to eq("/login")

    expect(page).to have_content("Username")
    expect(page).to have_content("Password")

    expect(page).to have_button("Create Account")
  end
end
