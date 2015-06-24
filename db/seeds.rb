user = User.new(
  name: "Member",
  email: "member@example.com",
  password: "helloworld"
  )
user.skip_confirmation!
user.save!

5.times do 
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

50.times do 
  item = Item.new(
    name: Faker::Commerce.product_name,
    user: users.sample
    )
  item.save!
end


puts "Seeding Finsihed"
puts "#{User.count} users."
puts "#{Item.count} items."