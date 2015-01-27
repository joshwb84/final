# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
Category.delete_all
Item.delete_all
User.delete_all
Rental.delete_all
Comment.delete_all

# Create the category
puts "Creating categories..."
electrical = Category.create(category: "Electrical equipment")
sound = Category.create(category: "Sound equipment")
rcc = Category.create(category: "RCC equipment")

# Create the users
puts "Creating your Users dog..."
user_one = User.create(name: "John Billy",playa_name: "butt wax",email: "John@aol.com",password: "slipknow23")
user_two = User.create(name: "Alex Smart",playa_name: "speed",email: "smartalex@gmail.com",password: "AAlex123")
user_three = User.create(name: "Steph Graph",playa_name: "Warp",email: "Graphme@hotmail.com",password: "Steph123")
user_four = User.create(name: "Brian Eno",playa_name: "butter boy",email: "EnosMusic@yahoo.com",password: "BrianKnowsPW")
user_five = User.create(name: "Laura bobbit",playa_name: "hot pocket",email: "laura@gmail.com",password: "lauraspassword")


# Create the items
puts "Creating your items..."
item_one = Item.create(category_id: rcc.id,name: "wagon cover",description: "Cloth cover",storage_home: "storage facility",identifier: "xasdnwu29348",owner: "mystopia",purchase_date: "1-21-13",purchase_price:"12.99")
item_two = Item.create(category_id: electrical.id,name: "electrical cord",description: "orange",storage_home: "vacaville",identifier: "xtec9348",owner: "james",purchase_date: "1-11-12",purchase_price:"14")
item_three = Item.create(category_id: rcc.id,name: "Cowshead",description: "fragile",storage_home: "james",identifier: "xas34ssc48",owner: "bukstein",purchase_date: "12-11-14",purchase_price:"111.99")
item_four = Item.create(category_id: sound.id,name: "Speakers",description: "blast 40db",storage_home: "storage facility2",identifier: "xasgrt3u29348",owner: "mystopia",purchase_date: "3-4-13",purchase_price:"donated")
item_five = Item.create(category_id: electrical.id,name: "lights",description: "needs generator. no bulb",storage_home: "reno",identifier: "xasdsdt",owner: "papabear",purchase_date: "6-5-13",purchase_price:"87")

# Create the rentals
puts "Creating your rentals..."
rental_one = Rental.create(item_id: item_one.id,user_id: user_two.id,rental_date: "1-1-2015",return_date: "1-2-2015")
rental_two = Rental.create(item_id: item_three.id,user_id: user_four.id,rental_date: "1-11-2015",return_date: "")
rental_three = Rental.create(item_id: item_two.id,user_id: user_three.id,rental_date: "1-21-2015",return_date: "")
rental_four = Rental.create(item_id: item_four.id,user_id: user_one.id,rental_date: "1-12-2015",return_date: "1-13-2015")
rental_five = Rental.create(item_id: item_one.id,user_id: user_five.id,rental_date: "1-13-2015",return_date: "1-14-2015")
rental_six = Rental.create(item_id: item_five.id,user_id: user_one.id,rental_date: "1-20-2015",return_date: "1-23-2015")

# Create the comments
puts "Creating your comments..."
comment_one = Comment.create(item_id: item_one.id,user_id: user_four.id,remark: "shit works well")
comment_two = Comment.create(item_id: item_two.id,user_id: user_one.id,remark: "replace soon")
comment_three = Comment.create(item_id: item_four.id,user_id: user_three.id,remark: "make sure to also checkout the laptop to run this")
comment_four = Comment.create(item_id: item_two.id,user_id: user_five.id,remark: "a few LEDs missing")
comment_five = Comment.create(item_id: item_three.id,user_id: user_two.id,remark: "Broken")

puts "A total of #{Item.count} items are in the database. #{Rental.count} rentals have occurred and there are #{User.count} users registered."
