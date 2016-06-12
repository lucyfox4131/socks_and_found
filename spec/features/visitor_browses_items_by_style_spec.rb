require 'rails_helper'

RSpec.feature "visitor browses by style" do
  scenario "visitor sees socks in a specific style" do
    sock_1, sock_2, sock_3 = create_list(:sock, 3)
    style = sock_1.style.slug

    visit "/#{style}"

    within '.socks' do
      expect(page).to have_link(sock_1.name, href: sock_path(sock_1))
      expect(page).to have_content sock_1.price
      expect(page).to have_css("img[src=\"#{sock_1.image_url.url(:medium)}\"]")

      expect(page).to_not have_content sock_2.name
    end
  end

  context "they should see the 404 page" do
    scenario "user enters invalid naviagtion title" do
      visit '/nonexistent'

      expect(page).to have_content "The page you were looking for doesn't exist (404)"
    end
  end
end
