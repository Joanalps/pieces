# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts "Cleaning database..."
# DEPENDENT destroys the rest?
Piece.destroy_all
Transaction.destroy_all
User.destroy_all

puts "Creating users..."
user_1 = {first_name: "Lara", last_name: "ElK", address: "33 rue de Lancry, 75010 Paris", email: "laraelk@gmail.com", password: "chocolate", top_size: 36, bottom_size: 36, shoe_size: 39}
user_2 = {first_name: "Joana", last_name: "Lps", address: "38 rue du château d'eau, 75010 Paris", email: "joanalps@icloud.fr", password: "chocolate", top_size: 36, bottom_size: 34, shoe_size: 38}
user_3 = {first_name: "Noémie", last_name: "Dlx", address: "80 avenue des Champs-Elysées, 75008 Paris", email: "noedlx@icloud.fr", password: "chocolate", top_size: 36, bottom_size: 36, shoe_size: 38}
user_4 = {first_name: "Camille", last_name: "Mns", address: "60 avenue de l'Opéra, 75008 Paris", email: "cmns@icloud.fr", password: "chocolate", top_size: 36, bottom_size: 36, shoe_size: 38}
user_5 = {first_name: "Lucie", last_name: "Dbr", address: "15 rue de la République, 69002 Lyon", email: "luciedbr@gmail.com", password: "croissant", top_size: 38, bottom_size: 40, shoe_size: 41}
user_6 = {first_name: "Sophie", last_name: "Rou", "address": "25 Boulevard Saint-Michel, 75005 Paris", email: "sophierou@icloud.fr", password: "baguette", "top_size": 46, bottom_size: 44, shoe_size: 39}
user_7 = {first_name: "Antoinette", last_name: "Lrv", address: "10 Rue de la Bastille, 13001 Marseille", email: "antoinettelrv@hotmail.com", password: "macaron", top_size: 40, bottom_size: 42, shoe_size: 43}
user_8 = {first_name: "Clara", last_name: "Grn", address: "5 Place de la Comédie, 34000 Montpellier", email: "claragrn@gmail.com", password: "croissant", top_size: 36, bottom_size: 38, shoe_size: 38}
user_9 = {first_name: "Maxime", last_name: "Blc", address: "18 Rue de la République, 59800 Lille", email: "maximeblc@yahoo.com", password: "fromage", top_size: 40, bottom_size: 40, shoe_size: 42}
user_10 = {first_name: "Léa", last_name: "Frv", address: "30 Rue du Faubourg Saint-Antoine, 75011 Paris", email: "leafrv@hotmail.com", password: "croissant", top_size: 38, bottom_size: 40, shoe_size: 40}
user_11 = {first_name: "Nicole", last_name: "Prt", address: "8 Rue de la Liberté, 69003 Lyon", email: "nicoleprt@gmail.com", password: "baguette", top_size: 40, bottom_size: 40, shoe_size: 44}
user_12 = {"first_name": "Emma", "last_name": "Lvr", "address": "14 Avenue des Gobelins, 75013 Paris", "email": "emmalvr@yahoo.com", "password": "macaron", "top_size": 36, "bottom_size": 36, "shoe_size": 38}
user_13 = {"first_name": "Huguette", "last_name": "Dfs", "address": "22 Rue de la République, 13002 Marseille", "email": "huguettedfs@hotmail.com", "password": "croissant", "top_size": 42, "bottom_size": 36, "shoe_size": 41}
user_14 = {"first_name": "Julie", "last_name": "Lcr", "address": "7 Rue du Faubourg Saint-Honoré, 75008 Paris", "email": "julielcr@gmail.com", "password": "baguette", "top_size": 44, "bottom_size": 46, "shoe_size": 39}
user_15 = {"first_name": "Paulette", "last_name": "Mrv", "address": "11 Place Bellecour, 69002 Lyon", "email": "paulettemrv@yahoo.com", "password": "croissant", "top_size": 40, "bottom_size": 42, "shoe_size": 43}
user_16 = {"first_name": "Amandine", "last_name": "Chs", "address": "3 Rue de la Paix, 75002 Paris", "email": "amandinechs@hotmail.com", "password": "macaron", "top_size": 36, "bottom_size": 36, "shoe_size": 38}
user_17 = {"first_name": "Céline", "last_name": "Lfn", "address": "9 Quai de la Tournelle, 75005 Paris", "email": "celinelfn@yahoo.com", "password": "baguette", "top_size": 38, "bottom_size": 40, "shoe_size": 40}
user_18 = {"first_name": "Chloé", "last_name": "Gvt", "address": "17 Rue Saint-Antoine, 75004 Paris", "email": "chloegvt@gmail.com", "password": "macaron", "top_size": 36, "bottom_size": 38, "shoe_size": 38}

[user_1, user_2, user_3, user_4, user_5, user_6, user_7, user_8, user_9, user_10, user_11, user_12, user_13, user_14, user_15, user_16, user_17, user_18].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end
puts "Finished with users!"

puts "creating pieces"
user = User.all.sample
piece_1 = {name: "The little black dress", category: "Dress", address: user.address, size: user.top_size, brand: "Ralph Lauren", color: "Black", description: "perfect for a chic funeral, sublime without provoc", tag: "Cocktail", delivery_mode: "Pick up", price_per_day: 150, user_id: user.id}

user = User.all.sample
piece_2 = {name: "The flamboyant pink dress", category: "Dress", address: user.address, size: user.top_size, brand: "Dior", color: "Pink", description: "perfect for a very special night out", tag: "Party", delivery_mode: "Delivery", price_per_day: 200, user_id: user.id}

user = User.find_by_first_name("Joana")
piece_3 = {name: "Long black dress", category: "Dress", address: user.address, size: user.top_size, brand: "Chanel", color: "Black", description: "perfect for a very chic date", tag: "Party", delivery_mode: "Pick up", price_per_day: 100, user_id: user.id}

# BRAND = ['Dior', 'Chanel', 'Ralph Lauren', 'Celine', 'Isabel Marant', 'Lacoste', 'Sandro', 'Maje', 'Bash', 'Kooples']
# SIZE = [34, 36, 38, 40, 42, 44, 46, 48]
# CATEGORY = ['Coat', 'Jacket', 'Sweater', 'Dress', 'Blouse', 'Top', 'Jeans', 'Pants', 'Skirt', 'Purse']
# COLOR = ['Black', 'White', 'Beige', 'Grey', 'Blue', 'Red', 'Green', 'Yellow', 'Pink', 'Orange', 'Purple', 'Multicolor']
# TAG = ['Casual', 'Wedding', 'Cocktail', 'Business', 'Party', 'Everyday chic']
# DELIVERY_MODE = ['Pick up', 'Delivery']

user = User.find_by_first_name("Joana")
piece_4 = {name: "Long green dress", category: "Dress", address: user.address, size: user.top_size, brand: "Dior", color: "Green", description: "perfect for a very chic date or a cocktail", tag: "Cocktail", delivery_mode: "Pick up", price_per_day: 100, user_id: user.id}

user = User.find_by_first_name("Camille")
piece_5 = {name: "Yellow suit", category: "Pants", address: user.address, size: user.bottom_size, brand: "Maje", color: "Yellow", description: "bright colors make your day sunnier", tag: "Everyday chic", delivery_mode: "Delivery", price_per_day: 50, user_id: user.id}

user = User.all.sample
piece_6 =  {name: "Oversize green full suit", category: "Pants", address: user.address, size: user.bottom_size, brand: "Ralph Lauren", color: "Green", description: "Bold looks, bold day", tag: "Everyday chic", delivery_mode: "Pick up", price_per_day: 40, user_id: user.id}

user = User.all.sample
piece_7 = {name: "Lacoste Blouse", :brand=>"Lacoste", :category=>"Blouse", :color=>"Multicolor", :tag=>"Party", :delivery_mode=>"Delivery", size: user.top_size, user_id: user.id, price_per_day: 20, description: "Color everywhere", address: user.address}

user = User.all.sample
piece_8 =  {name: "Classic classy white blouse", category: "Blouse", address: user.address, size: user.top_size, brand: "Ralph Lauren", color: "White", description: "If you want to make an impression", tag: "Everyday chic", delivery_mode: "Pick up", price_per_day: 30, user_id: user.id}

user = User.all.sample
piece_9 =  {name: "Wedding dress", category: "Dress", address: user.address, size: user.top_size, brand: "Ralph Lauren", color: "White", description: "Perfect fit for a perfect day", tag: "Wedding", delivery_mode: "Pick up", price_per_day: 300, user_id: user.id}

user = User.find_by_first_name("Julie")
piece_10 =  {name: "Floral dress for a wedding reception", category: "Dress", address: user.address, size: user.top_size, brand: "Ralph Lauren", color: "Multicolor", description: "Tight fit, if you want to stand out", tag: "Wedding", delivery_mode: "Pick up", price_per_day: 200, user_id: user.id}

puts 'Addind images...'
images = ["https://i.pinimg.com/originals/3f/85/4e/3f854eb4e94b919354cdaf6367037a57.jpg", "https://i.pinimg.com/originals/70/ff/3e/70ff3e00dc350f5cd1e703ae676d0992.jpg", "https://www.kocku.com/cdn/shop/products/L1809_1_720x.jpg?v=1681971238", "https://i.pinimg.com/564x/95/db/9a/95db9a17927a1b6e43742ab9edbb2441.jpg", "https://i.pinimg.com/564x/bd/d8/16/bdd81660d207263d1d0a68ebf6350b54.jpg", "https://i.pinimg.com/564x/7e/ec/03/7eec03f1bf72b1c59255242d997f515b.jpg", "https://images.asos-media.com/products/lacoste-x-polaroid-polo-a-rayures-multicolore/23085875-3?$n_640w$&wid=513&fit=constrain", "https://www.pimkie.fr/dw/image/v2/AAYN_PRD/on/demandware.static/-/Sites-pimkie-master-catalog/default/dwdc0fd435/images/562641_912A09_portrait_HD_1.JPG?sw=592&sh=731", "https://www.whiteonebridal.com/media/catalog/product/d/e/delite_b.jpg?quality=80&bg-color=255,255,255&fit=bounds&height=747&width=560&canvas=560:747", "https://i.pinimg.com/originals/08/38/0e/08380e0dac9b750fef119f8f7eedb21e.jpg"
]
image_index = 0

[piece_1, piece_2, piece_3, piece_4, piece_5, piece_6, piece_7, piece_8, piece_9, piece_10].each do |attributes|
  piece = Piece.new(attributes)
  file = URI.open(images[image_index])
  piece.photos.attach(io: file, filename: "#{piece.name}.png", content_type: "image/png")
  piece.save!
  image_index += 1
  puts "Created #{piece.name}"
end
puts "Finished with pieces!"

puts "creating transactions"
# piece = Piece.all.sample
# transaction_1 = {piece_id: piece.id, start_date: Date.today, end_date: Date.today + 3}

# puts "creating transactions"
# renting = User.all.sample
# piece = Piece.where.not(user: renting).sample
# transaction_2 = {user_id: renting.id, piece_id: piece.id, start_date: Date.today + 3, end_date: Date.today + 5}

40.times do
  start_date = Date.today + rand(0..15)
  end_date = start_date + rand(1..15)
  renting = User.all.sample
  piece = Piece.where.not(user: renting).sample
  transaction = Transaction.create(user_id: renting.id, piece_id: piece.id, start_date:, end_date:)
  puts "Created transaction number #{transaction.id}"
end

# [transaction_2].each do |attributes|
#   transaction = Transaction.create!(attributes)
#   puts "Created #{transaction.id}"
# end
puts "Finished with transactions!"
