require "rails_helper"

RSpec.feature "admin login and admin dashboard tests" do
  context "admin logs in" do
    scenario "they are redirected to their dashboard" do
      admin = User.create(name: "admin name",
                          username: "admin123",
                          password: "password",
                          role: 1)
      login(admin)

      expect(current_path).to eq("/admin/dashboard")
      expect(page).to have_content("Admin Dashboard")
    end
  end

  context "unregistered user tries to visit admin dashboard" do
    scenario "they get a 404" do
      visit "/admin/dashboard"

      expect(page).to have_content("The page you were
                                    looking for doesn't exist (404)")
    end
  end
end
