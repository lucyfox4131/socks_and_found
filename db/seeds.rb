# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category_1 = Category.create(title: "Men")
category_2 = Category.create(title: "Women")
category_3 = Category.create(title: "Kids")
category_4 = Category.create(title: "Unisex")

size_1 = Size.create(value: "Large")
size_2 = Size.create(value: "Medium")
size_3 = Size.create(value: "Small")

style_1 = Style.create(name: "Dress")
style_2 = Style.create(name: "Athletic")
style_3 = Style.create(name: "Mid Calf")
style_4 = Style.create(name: "Wool")
style_5 = Style.create(name: "Ankle")
style_6 = Style.create(name: "Pop Culture")
style_7 = Style.create(name: "Party Time")

socks = [{ name: "The Long Stick Middies", foot: "Left", price: 5.99, image_url: File.new("app/assets/images/long_stick_middies.jpg"),
  style_id: style_3.id, category_id: category_1.id, size_id: size_2.id },
         { name: "The Steph Currys", foot: "Right", price: 6.99, image_url: "http://i.ebayimg.com/00/s/NjI2WDM5MA==/z/1R8AAOSwHnFVs~WG/$_1.JPG", style_id: style_3.id, category_id: category_4.id, size_id: size_3.id },
         { name: "The Caviar Cliffords", foot: "Right", price: 9.99, image_url: "https://cdn1.boldsocks.com/wp-content/uploads/2015/03/2240870-20182.jpg", style_id: style_1.id, category_id: category_4.id, size_id: size_1.id },
         { name: "The One Man Wolf Packs", foot: "Left", price: 9.99, image_url: "http://ep.yimg.com/ay/beltoutlet/windsor-collection-men-s-mid-calf-merino-wool-dress-socks-40.gif", style_id: style_1.id, category_id: category_1.id, size_id: size_2.id },
         { name: "The Say My Names", foot: "Right", price: 10.49, image_url: "http://images.asos-media.com/inv/media/4/6/7/7/5217764/image2xxl.jpg", style_id: style_6.id, category_id: category_4.id, size_id: size_1.id },
         { name: "The These Little Piggis Went To Markets", foot: "Right", price: 8.95, image_url: "http://photos.amazingsocks.com/500/277-hot-sox-toe-socks-multi-16275.jpg", style_id: style_7.id, category_id: category_2.id, size_id: size_3.id },
         { name: "The WHAT ARE THOSE", foot: "Left", price: 11.95, image_url: "https://www.acorn.com/products/images/xlarge/10118_ACK_xl.jpg", style_id: style_4.id, category_id: category_1.id, size_id: size_1.id },
         { name: "The Cowboy Ups", foot: "Right", price: 250.95, image_url: "https://usatftw.files.wordpress.com/2014/11/c01_sline_bloodysock_19_53674703.jpg?w=1000&h=674", style_id: style_2.id, category_id: category_4.id, size_id: size_1.id },
         { name: "The Masterpieces", foot: "Right", price: 13.05, image_url: "http://www.joyofsocks.com/media/catalog/product/cache/1/image/398x398/9df78eab33525d08d6e5fb8d27136e95/h/m/hm400004-sk-asst1-984_120919__50737.jpg", style_id: style_1.id, category_id: category_2.id, size_id: size_2.id },
         { name: "The Make Your Feet Great Agains", foot: "Left", price: 15.99, image_url: "http://cdn.shopify.com/s/files/1/0813/1345/products/HYDT16.jpg?v=1455225804", style_id: style_6.id, category_id: category_4.id, size_id: size_2.id },
         { name: "The Scrub a Dub Dubs", foot: "Right", price: 15.99, image_url: "https://s-media-cache-ak0.pinimg.com/236x/bc/b8/11/bcb8115b0d9bd316c5d496217b0eef1f.jpg", style_id: style_7.id, category_id: category_3.id, size_id: size_3.id },
         { name: "The Shoobies", foot: "Left", price: 15.99, image_url: "http://ecx.images-amazon.com/images/I/71JGm%2B2pUkL._SL1500_.jpg", style_id: style_7.id, category_id: category_4.id, size_id: size_2.id }]

# socks.each do |sock|
#   Sock.create(sock)
# end
