User.create!(user_name: "Admin account", email: "admin@gmail.com",
  password: "123123", role: 4, password_confirmation: "123123", 
  address: "123 Nguyen Luong Bang", phone_number: "098732232")
User.create!(user_name: "Moderator account", email: "mod@gmail.com",
  password: "123123", role: 3, password_confirmation: "123123", 
  address: "123 Nguyen Luong Bang", phone_number: "098732232")
User.create!(user_name: "Shop owner account", email: "shopowner@gmail.com",
  password: "123123", role: 2, password_confirmation: "123123", 
  address: "123 Nguyen Luong Bang", phone_number: "098732232")
User.create!(user_name: "Staff account", email: "staff@gmail.com",
  password: "123123", role: 1, password_confirmation: "123123",
  address: "12 Bach Dang", phone_number: "01233291821")
User.create!(user_name: "User account", email: "user@gmail.com",
  password: "123123", role: 0, password_confirmation: "123123",
  address: "123 Ngo Thi Nham", phone_number: "0987138191")

30.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@gmail.com"
  address = "#{n+1} Le Duan"
  phone_number = "0988777666"
  password = "user123"
  User.create!(user_name: name, email: email, password: password, 
    address: address, password_confirmation: password, phone_number: phone_number )
end

ShopType.create!(name: "House coffee")
ShopType.create!(name: "Garden coffee")

50.times do |n|
  name = "Shop #{n+1}"
  description = Faker::Lorem.sentence 20
  address = "#{n+1} Le Duan"
  status = 1
  user_id = 1
  shop_type_id = rand 1..2
  Shop.create!(name: name, description: description, address: address,
    user_id: user_id, shop_type_id: shop_type_id, status: status)
end

500.times do |n|
  name = "Table #{n+1}"
  location = "A"
  num_chair = rand 2..6
  shop_id = rand 1..50
  status = rand 0..1
  Table.create!(name: name, location: location, num_chair: num_chair,
    shop_id: shop_id, status: status)
end

Category.create!(name: "Coffee")
Category.create!(name: "Tea")
Category.create!(name: "Soda")
Category.create!(name: "Cocktail")

100.times do |n|
  name = "Product #{n+1}"
  price = rand 10..200
  category_id = rand 1..4
  description = Faker::Lorem.sentence 20
  Product.create!(name: name, price: price, category_id: category_id, 
    description: description)
end

30.times do |n|
  name  = "Suggest product #{n+1}"
  user_id = rand 3..10
  description = Faker::Lorem.sentence 20
  Suggestion.create!(name: name, user_id: user_id, description: description)
end
