require "rails_helper"

RSpec.feature "admin edits data" do
  context "admin edits their own data" do
    scenario "admin edits name" do
      admin = User.create(name: "admin name",
                          username: "admin123",
                          password: "password",
                          role: 1)
      login(admin)

      visit admin_dashboard_path
      click_button "Edit Account Info"
      expect(current_path).to eq(edit_user_path(admin))
      fill_in "Name", with: "new name"
      fill_in "Password", with: "newpassword"
      fill_in "Password confirmation", with: "newpassword"
      click_button "Update"
      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Logged in as new name")
    end
  end

  context "admin tries to edit another user's data" do
    scenario "admin cannot edit name" do
      admin = User.create(name: "admin name",
                          username: "admin123",
                          password: "password",
                          role: 1)
      user1 = create(:user)
      login(admin)
      visit edit_user_path(user1)

      expect(current_path).to eq(edit_user_path(user1))
      expect(page).to have_content(admin.name)
      expect(page).to_not have_content(user1.name)
    end
  end
end
