# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [{ title: "Men" },
              { title: "Women" },
              { title: "Kids" },
              { title: "Unisex"}]

sizes = [{ value: "Large" },
         { value: "Medium" },
         { value: "Small" }]

styles = [{ name: "Dress" },
          { name: "Athletic" },
          { name: "Mid Calf" },
          { name: "Wool" },
          { name: "Ankle" }]

socks = [{ name: "The Long Stick Middies", foot: "Left", price: 5.99, image_url: "http://www.dickssportinggoods.com/graphics/product_images/pDSP1-10522711dt.jpg", style_id: 3, category_id: 1, size_id: 2 },
         { name: "The Steph Currys", foot: "Right", price: 6.99, image_url: "http://i.ebayimg.com/00/s/NjI2WDM5MA==/z/1R8AAOSwHnFVs~WG/$_1.JPG", style_id: 3, category_id: 4, size_id: 3 },
         { name: "The Caviar Cliffords", foot: "Right", price: 9.99, image_url: "https://cdn1.boldsocks.com/wp-content/uploads/2015/03/2240870-20182.jpg", style_id: 1, category_id: 4, size_id: 1 },
         { name: "The One Man Wolf Pack", foot: "Left", price: 9.99, image_url: "http://ep.yimg.com/ay/beltoutlet/windsor-collection-men-s-mid-calf-merino-wool-dress-socks-40.gif", style_id: 1, category_id: 1, size_id: 2 }]


categories.each do |category|
  Category.create(category)
end

sizes.each do |size|
  Size.create(size)
end

styles.each do |style|
  Style.create(style)
end

socks.each do |sock|
  Sock.create(sock)
end
