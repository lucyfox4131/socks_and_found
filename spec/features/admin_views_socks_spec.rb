require "rails_helper"

RSpec.feature "Admin can see all items" do
  scenario "admin can view all items in the sock store" do
    admin = User.create(name: "bob",
                        username: "adminbob",
                        password: "password",
                        role: 1)
    sock_1, sock_2, sock_3 = create_list(:sock, 3)
    sock_3.update_attributes(retired: true)

    login(admin)

    visit "/admin/dashboard"
    expect(page).to have_button("View All Socks")
    click_button "View All Socks"

    expect(current_path).to eq("/admin/socks")
    within "#sock-table" do
      expect(page).to have_content(sock_1.name)
      expect(page).to have_css("img[src=\"#{sock_2.image_url.url(:thumb)}\"]")
      expect(page).to have_content(sock_3.name)
      expect(page).to have_content("#{sock_3.name} is retired")
      expect(page).to have_link("Edit")
    end
  end
end
