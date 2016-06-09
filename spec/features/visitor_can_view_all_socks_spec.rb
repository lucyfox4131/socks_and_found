require 'rails_helper'

RSpec.feature "Visitor views all socks" do
  scenario "they see the grid of all socks" do
    sock_1, sock_2, sock_3 = create_list(:sock, 3)

    visit socks_path
    within("#all_socks") do
      expect(page).to have_link(sock_1.name, href: sock_path(sock_1))
      expect(page).to have_content sock_1.price
      expect(page).to have_content sock_2.foot
      expect(page).to have_css("img[src=\"#{sock_3.image_url}\"]")
    end
  end
end
