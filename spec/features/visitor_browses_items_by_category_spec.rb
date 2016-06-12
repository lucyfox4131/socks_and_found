require 'rails_helper'

RSpec.feature "visitor browses category" do
  scenario "visitor sees socks in a specific category" do
    sock_1, sock_2, sock_3 = create_list(:sock, 3)
    category = sock_1.category.slug
    visit "/#{category}"
    within '.one-sock' do
      expect(page).to have_link(sock_1.name, href: sock_path(sock_1))
      expect(page).to have_content sock_1.price
      expect(page).to have_css("img[src=\"#{sock_1.image_url.url(:medium)}\"]")
      expect(page).to_not have_link(sock_2.name, href: sock_path(sock_2))
    end
  end
end
