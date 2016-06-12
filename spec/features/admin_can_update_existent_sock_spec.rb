require "rails_helper"

RSpec.feature "Admin clicks Edit to change attributes of existent sock" do
  scenario "Admin is able to successfully update sock data" do
    admin = create(:user)

    Style.create(name: "Dress")
    Category.create(title: "Men")
    Size.create(value: "Small")

    sock = create(:sock)
    admin.update_attributes(role: 1)
    login(admin)
    click_button "View All Socks"
    click_link "Edit"
    fill_in "Name", with: "Sucky Sock"
    fill_in "Price", with: 0.01
    click_on "Update Sock"
    expect(page).to have_content "Sucky Sock"
    expect(page).to have_content "$0.01"
  end

  scenario "Admin is unsuccessful at updating attributes" do
    admin = create(:user)
    Style.create(name: "Dress")
    Category.create(title: "Men")
    Size.create(value: "Small")
    sock = create(:sock)
    admin.update_attributes(role: 1)
    login(admin)
    click_button "View All Socks"
    click_link "Edit"
    fill_in "Name", with: ""
    fill_in "Price", with: ""
    click_on "Update Sock"
    expect(page).to have_content "Name can't be blank"
  end
end
