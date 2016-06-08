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

socks = [{ name: "The Long Stick Middies", foot: "Left", price: 5.99, image_url: "http://www.dickssportinggoods.com/graphics/product_images/pDSP1-10522711dt.jpg", style_id: style_3.id, category_id: category_1.id, size_id: size_2.id },
         { name: "The Steph Currys", foot: "Right", price: 6.99, image_url: "http://i.ebayimg.com/00/s/NjI2WDM5MA==/z/1R8AAOSwHnFVs~WG/$_1.JPG", style_id: style_3.id, category_id: category_4.id, size_id: size_3.id },
         { name: "The Caviar Cliffords", foot: "Right", price: 9.99, image_url: "https://cdn1.boldsocks.com/wp-content/uploads/2015/03/2240870-20182.jpg", style_id: style_1.id, category_id: category_4.id, size_id: size_1.id },
         { name: "The One Man Wolf Pack", foot: "Left", price: 9.99, image_url: "http://ep.yimg.com/ay/beltoutlet/windsor-collection-men-s-mid-calf-merino-wool-dress-socks-40.gif", style_id: style_1.id, category_id: category_1.id, size_id: size_2.id }]

socks.each do |sock|
  Sock.create(sock)
end
