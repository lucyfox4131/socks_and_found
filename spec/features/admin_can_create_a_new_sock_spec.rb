require "rails_helper"

RSpec.feature "Admin creates a new sock" do
  scenario "admin successfully creates a new sock" do
    admin = User.create(name: "bob",
                        username: "adminbob",
                        password: "password",
                        role: 1)
    Style.create(name: "Dress")
    Category.create(title: "Women")
    Size.create(value: "Medium")

    login(admin)
    visit "/admin/dashboard"
    click_button "Add New Sock"
    expect(current_path).to eq(new_admin_sock_path)
    expect(page).to have_content("Create New Sock")
    fill_in "Name", with: "Awesome Socks"
    fill_in "Price", with: 21.98
    select "Left", from: "Foot"
    select "Dress", from: "Style"
    select "Women", from: "Category"
    select "Medium", from: "Size"
    click_on "Create Sock"

    expect(current_path).to eq(admin_socks_path)
    expect(page).to have_content("Awesome Socks")
    expect(page).to have_content("Successfully created new sock!")
  end

  scenario "Admin unsuccessfully tries to create a sock" do
    admin = User.create(name: "bob",
                        username: "adminbob",
                        password: "password",
                        role: 1)

    Style.create(name: "Dress")
    Category.create(title: "Men")
    Size.create(value: "Small")

    login(admin)
    visit "/admin/dashboard"
    click_button "Add New Sock"
    expect(current_path).to eq(new_admin_sock_path)
    expect(page).to have_content("Create New Sock")
    click_on "Create Sock"
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Price can't be blank")
  end
end
