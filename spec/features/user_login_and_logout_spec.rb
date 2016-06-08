require "rails_helper"

RSpec.feature "User Logs In and Logs Out" do
  context "Login tests" do
    scenario "existing user can login" do
    User.create(name: "Charlie", username: "Charlie123", password: "password")
    visit login_path
    fill_in "Username", with: "Charlie123"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Logged in as Charlie")
    assert page.has_content?("Logout")
  end

    scenario "guest cannot login" do
    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Invalid login. Please try again.")
    assert page.has_content?("Login")
  end

    scenario "registered user cannot login with wrong password" do
    User.create(name: "Charlie", username: "Charlie123",
                       password: "password")

    visit login_path
    fill_in "Username", with: "Charlie123"
    fill_in "Password", with: "notmypassword"
    click_button "Login"

    assert page.has_content?("Invalid login. Please try again.")
    assert page.has_content?("Login")
    end
  end

  context "logout test" do
    scenario "user is returned to login page" do
    User.create(name: "Charlie", username: "Charlie123", password: "password")
    visit login_path
    fill_in "Username", with: "Charlie123"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Logged in as Charlie")

    click_link "Logout"

    assert page.has_content?("Goodbye!")
    assert page.has_content?("Login")
    end
  end
end
