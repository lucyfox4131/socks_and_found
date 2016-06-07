FactoryGirl.define do
  factory :style do
    name {generate(:style_name)}
  end

  sequence :style_name do |n|
    "#{n} style"
  end

  factory :category do
    title
  end

  sequence :title, ["A", "B", "C", "D"].cycle do |n|
    "#{n}_title"
  end

  factory :size do
    value
  end

  sequence :value do |n|
    "#{n} value"
  end

  factory :sock do
    name { generate(:sock_name) }
    foot
    price
    image_url "http://im.uniqlo.com/images/uk/pc/goods/168190/item/15_168190_middles.jpg"
    style
    category
    size
  end

  sequence :sock_name do |n|
    "#{n} sock name"
  end

  sequence :foot, ["L", "R"].cycle do |n|
    "#{n} foot"
  end

  sequence :price do |n|
    "#{n} price"
  end

end
