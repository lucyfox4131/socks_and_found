require "rails_helper"
#
# RSpec.feature "visitor removes sock from cart" do
#   context "socks are in a visitors cart" do
#     scenario "visitor can successfully remove socks from the cart" do
#       sock = create(:sock)
#       add_to_cart(sock)
#
#       visit "/cart"
#
#       expect(page).to have_content("Cart Total: $#{sock.price}")
#
#       click_link "Remove"
#
#       expect(current_path).to eq("/cart")
#       expect(page).to have_css(:color => 'green')
#       expect(page).to have_content("Successfully removed #{sock.name} from your cart.")
#       expect(page).to have_link("#{sock.name}")
#
#       expect(page).to_not have_content("Cart Total: $0")
#     end
#   end
# end
# 
# # Background: My cart has an item in it
#
# # Then my current page should be "/cart"
# # And I should see a message styled in green
# # And the message should say "Successfully removed SOME_ITEM from your cart."
# # And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
# # And I should not see the item listed in cart
