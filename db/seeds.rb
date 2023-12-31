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

puts "Creating users attributes..."
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

# [user_1, user_2, user_3, user_4, user_5, user_6, user_7, user_8, user_9, user_10, user_11, user_12, user_13, user_14, user_15, user_16, user_17, user_18].each do |attributes|
#   user = User.create!(attributes)
#   puts "Created #{user.first_name}"
# end
# puts "Finished with users!"
puts "Fetching users profiles pictures..."

user_img_1 = 'https://media.istockphoto.com/id/1372281808/fr/photo/profil-du-visage-de-la-femme-portrait-de-jeune-fille-avec-une-peau-lisse-et-saine-mod%C3%A8le.jpg?s=612x612&w=0&k=20&c=q1yuhsE2Ma7YFpobO7oqIMmzqnMdFeaC1gF7keCEPBU='
user_img_2 = 'https://i.pinimg.com/736x/d5/59/bd/d559bd5ffda47d35f8d5ce8de8d6f325.jpg'
user_img_3 = 'https://images.unsplash.com/photo-1499557354967-2b2d8910bcca?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHNob3J0JTIwaGFpciUyMGdpcmx8ZW58MHx8MHx8fDA%3D'
user_img_4 = 'https://shotkit.com/wp-content/uploads/bb-plugin/cache/cool-profile-pic-matheus-ferrero-landscape-6cbeea07ce870fc53bedd94909941a4b-zybravgx2q47.jpeg'
user_img_5 = 'https://newprofilepic.photo-cdn.net//assets/images/article/profile.webp?90af0c8'
user_img_6 = 'https://i.pinimg.com/564x/55/91/80/5591809ff56c527ff1897828d2fb3290.jpg'
user_img_7 = 'https://i.pinimg.com/564x/55/91/80/5591809ff56c527ff1897828d2fb3290.jpg'
user_img_8 = 'https://img.freepik.com/premium-photo/face-contouring-aesthetic-cosmetology-profile-portrait-brunette-woman-isolated-white-copy_279525-19004.jpg'
user_img_9 = 'https://st2.depositphotos.com/13194036/42440/i/450/depositphotos_424400434-stock-photo-profile-african-american-young-woman.jpg'
user_img_10 = 'https://i.pinimg.com/564x/0d/92/ba/0d92ba3e84b9f15dea2659fb4d8b6dfd.jpg'
user_img_11 = 'https://media.istockphoto.com/id/1272950678/photo/side-view-of-smiling-mature-woman.jpg?s=612x612&w=0&k=20&c=3HZU561TdOMWdVQehuvqqPOwRqmnI3YwW1vk67A9XR8='
user_img_12 = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRZ26VyVK1_qexx-0XYFxzJkdL2uLpJvPaMVMKSkyt&s'
user_img_13 = 'https://st4allthings4p4ci.blob.core.windows.net/allthingshair/allthingshair/wp-content/uploads/sites/8/2019/06/rainbow-hair-color-bob-shutterstock.jpg'
user_img_14 = 'https://img.huffingtonpost.com/asset/5755d428130000a109383ba7.jpeg?ops=scalefit_960_noupscale'
user_img_15 = 'https://images.jpost.com/image/upload/f_auto,fl_lossy/c_fill,g_faces:center,h_428,w_640/551359'
user_img_16 = 'https://i0.wp.com/www.coilsandglory.com/wp-content/uploads/2023/03/hermanthaa.l.jpg?resize=1080%2C1080&ssl=1'
user_img_17 = 'https://i.pinimg.com/originals/5c/b9/fb/5cb9fb6a1e79f8960f7bbd5713a44ca1.jpg'
user_img_18 = 'https://i0.wp.com/bbeautyarabia.com/wp-content/uploads/2022/09/Doaa-Gawish.jpeg?resize=491%2C532&ssl=1'

user_images = [ user_img_1, user_img_2,  user_img_3, user_img_4, user_img_5, user_img_6, user_img_7, user_img_8, user_img_9, user_img_10, user_img_11, user_img_12, user_img_13, user_img_14, user_img_15, user_img_16, user_img_17, user_img_18 ]

user_image_index = 0

puts 'Creating users...'
[user_1, user_2, user_3, user_4, user_5, user_6, user_7, user_8, user_9, user_10, user_11, user_12, user_13, user_14, user_15, user_16, user_17, user_18].each do |attributes|
  user = User.new(attributes)
  file = URI.open(user_images[user_image_index])
  user.photo.attach(io: file, filename: "#{user.first_name}.png", content_type: "image/png")
  user.save!
  user_image_index += 1
  puts "Created #{user.first_name}"
end
puts "Finished with users!"

puts "Generating pieces attributes"
user = User.all.sample
piece_1 = {name: "The little black dress", category: "Dress", address: user.address, size: user.top_size, brand: "Ralph Lauren", color: "Black", description: "Sublime without provoc", tag: "Cocktail", delivery_mode: "Pick up", price_per_day: 150, user_id: user.id}

user = User.find_by_first_name("Camille")
piece_2 = {name: "The long green dress", category: "Dress", address: user.address, size: user.top_size, brand: "Ralph Lauren", color: "Green", description: "For celebrations", tag: "Cocktail", delivery_mode: "Pick up", price_per_day: 160, user_id: user.id}

user = User.all.sample
piece_3 = {name: "The flamboyant pink dress", category: "Dress", address: user.address, size: user.top_size, brand: "Dior", color: "Pink", description: "For a very special night out", tag: "Party", delivery_mode: "Delivery", price_per_day: 200, user_id: user.id}

user = User.find_by_first_name("Joana")
piece_4 = {name: "White suit", category: "Pants", address: user.address, size: user.bottom_size, brand: "Chanel", color: "White", description: "Perfect for a chic date", tag: "Everyday chic", delivery_mode: "Pick up", price_per_day: 100, user_id: user.id}

# BRAND = ['Dior', 'Chanel', 'Ralph Lauren', 'Celine', 'Isabel Marant', 'Lacoste', 'Sandro', 'Maje', 'Bash', 'Kooples']
# SIZE = [34, 36, 38, 40, 42, 44, 46, 48]
# CATEGORY = ['Coat', 'Jacket', 'Sweater', 'Dress', 'Blouse', 'Top', 'Jeans', 'Pants', 'Skirt', 'Purse']
# COLOR = ['Black', 'White', 'Beige', 'Grey', 'Blue', 'Red', 'Green', 'Yellow', 'Pink', 'Orange', 'Purple', 'Multicolor']
# TAG = ['Casual', 'Wedding', 'Cocktail', 'Business', 'Party', 'Everyday chic']
# DELIVERY_MODE = ['Pick up', 'Delivery']

user = User.find_by_first_name("Camille")
piece_5 = {name: "Yellow suit", category: "Pants", address: user.address, size: user.bottom_size, brand: "Maje", color: "Yellow", description: "Bright colors make your day sunnier", tag: "Everyday chic", delivery_mode: "Delivery", price_per_day: 50, user_id: user.id}

user = User.all.sample
piece_6 =  {name: "Oversize green full suit", category: "Pants", address: user.address, size: user.bottom_size, brand: "Ralph Lauren", color: "Green", description: "Bold looks, bold day", tag: "Everyday chic", delivery_mode: "Pick up", price_per_day: 40, user_id: user.id}

user = User.all.sample
piece_7 = {name: "Lacoste Blouse", :brand=>"Lacoste", :category=>"Blouse", :color=>"Multicolor", :tag=>"Party", :delivery_mode=>"Delivery", size: user.top_size, user_id: user.id, price_per_day: 20, description: "Color everywhere", address: user.address}

user = User.all.sample
piece_8 =  {name: "Classic classy white blouse", category: "Blouse", address: user.address, size: user.top_size, brand: "Ralph Lauren", color: "White", description: "If you want to make an impression", tag: "Everyday chic", delivery_mode: "Pick up", price_per_day: 30, user_id: user.id}

user = User.all.sample
piece_9 =  {name: "Wedding dress", category: "Dress", address: user.address, size: user.top_size, brand: "Ralph Lauren", color: "White", description: "Perfect fit for a perfect day", tag: "Wedding", delivery_mode: "Pick up", price_per_day: 300, user_id: user.id}

user = User.find_by_first_name("Julie")
piece_10 =  {name: "Floral dress for a wedding reception", category: "Dress", address: user.address, size: user.top_size, brand: "Ralph Lauren", color: "Multicolor", description: "If you want to stand out", tag: "Wedding", delivery_mode: "Pick up", price_per_day: 200, user_id: user.id}

user = User.all.sample
piece_11 =  {name: "Warmest classiest jumper for ski", category: "Sweater", address: user.address, size: user.top_size, brand: "Celine", color: "Grey", description: "Stay warm, stay classy", tag: "Casual", delivery_mode: "Pick up", price_per_day: 50, user_id: user.id}

user = User.all.sample
piece_12 =  {name: "Shine bright like a lurex", category: "Pants", address: user.address, size: user.bottom_size, brand: "Isabel Marant", color: "Green", description: "For celebrations or everyday", tag: "Everyday chic", delivery_mode: "Delivery", price_per_day: 50, user_id: user.id}

user = User.find_by_first_name("Joana")
piece_13 =  {name: "Classy white pants", category: "Pants", address: user.address, size: user.bottom_size, brand: "Isabel Marant", color: "White", description: "Fitted waist, loose everywhere else", tag: "Everyday chic", delivery_mode: "Delivery", price_per_day: 20, user_id: user.id}

user = User.find_by_first_name("Joana")
piece_14 =  {name: "Classy loose pants", category: "Pants", address: user.address, size: user.bottom_size, brand: "Isabel Marant", color: "Black", description: "Fitted waist, else very loose", tag: "Everyday chic", delivery_mode: "Delivery", price_per_day: 20, user_id: user.id}

user = User.find_by_first_name("Joana")
piece_15 =  {name: "Iconic Trench", category: "Coat", address: user.address, size: user.bottom_size, brand: "Kooples", color: "Beige", description: "Oversize", tag: "Everyday chic", delivery_mode: "Delivery", price_per_day: 40, user_id: user.id}

user = User.find_by_first_name("Joana")
piece_16 =  {name: "Winter jumper", category: "Sweater", address: user.address, size: user.bottom_size, brand: "Sandro", color: "Beige", description: "Real wool", tag: "Everyday chic", delivery_mode: "Delivery", price_per_day: 20, user_id: user.id}

user = User.find_by_first_name("Clara")
piece_17 =  {name: "Golden lurex dress", category: "Dress", address: user.address, size: user.bottom_size, brand: "Sandro", color: "Multicolor", description: "Amazing to wear", tag: "Party", delivery_mode: "Delivery", price_per_day: 30, user_id: user.id}

user = User.find_by_first_name("Julie")
piece_18 =  {name: "Silver & black strass dress", category: "Dress", address: user.address, size: user.bottom_size, brand: "Bash", color: "Multicolor", description: "Shiny, very shiny", tag: "Cocktail", delivery_mode: "Delivery", price_per_day: 30, user_id: user.id}

user = User.find_by_first_name("Amandine")
piece_19 =  {name: "Hippie chic burgundy dress", category: "Dress", address: user.address, size: user.bottom_size, brand: "Bash", color: "Red", description: "Loose and light", tag: "Cocktail", delivery_mode: "Delivery", price_per_day: 30, user_id: user.id}

user = User.find_by_first_name("Chloé")
piece_20 =  {name: "2-piece floral dress", category: "Dress", address: user.address, size: user.bottom_size, brand: "Dior", color: "Multicolor", description: "Quite fitted", tag: "Cocktail", delivery_mode: "Delivery", price_per_day: 100, user_id: user.id}

user = User.find_by_first_name("Céline")
piece_21 =  {name: "Pencil dress", category: "Dress", address: user.address, size: user.bottom_size, brand: "Dior", color: "Multicolor", description: "Very fitted", tag: "Cocktail", delivery_mode: "Delivery", price_per_day: 100, user_id: user.id}

user = User.find_by_first_name("Céline")
piece_22 =  {name: "Pencil black dress", category: "Dress", address: user.address, size: user.bottom_size, brand: "Chanel", color: "Black", description: "Loose fit", tag: "Cocktail", delivery_mode: "Pick up", price_per_day: 100, user_id: user.id}

user = User.all.sample
piece_23 =  {name: "Plisse dress", category: "Dress", address: user.address, size: user.bottom_size, brand: "Kooples", color: "Green", description: "Very fitted", tag: "Cocktail", delivery_mode: "Pick up", price_per_day: 100, user_id: user.id}

puts 'Fetching images...'
piece_1_img_1 = "https://i.pinimg.com/originals/3f/85/4e/3f854eb4e94b919354cdaf6367037a57.jpg"
piece_1_img_2 = "https://img.freepik.com/photos-gratuite/noir-texture-tissu-croise_1194-6339.jpg?size=626&ext=jpg"
piece_1_imgs = [piece_1_img_1, piece_1_img_2]

piece_2_imgs = ["https://www.lulus.com/images/product/xlarge/4463370_383032.jpg?w=560&hdpi=1", "https://www.lulus.com/images/product/xlarge/4463330_383032.jpg?w=560&hdpi=1", "https://www.lulus.com/images/product/xlarge/4463390_383032.jpg?w=560&hdpi=1", "https://www.lulus.com/images/product/xlarge/4463410_383032.jpg?w=560&hdpi=1", "https://www.lulus.com/images/product/xlarge/9754981_383032.jpg?w=560&hdpi=1"]

piece_3_imgs = ["https://www.kocku.com/cdn/shop/products/L1809_1_720x.jpg?v=1681971238"]

piece_4_imgs = ["https://i.pinimg.com/564x/95/db/9a/95db9a17927a1b6e43742ab9edbb2441.jpg"]

piece_5_imgs = ["https://i.pinimg.com/564x/bd/d8/16/bdd81660d207263d1d0a68ebf6350b54.jpg"]

piece_6_imgs = ["https://cdn-img.prettylittlething.com/8/6/2/1/8621fbc09ce48aa113ef6f0b8fdad1230213442a_cmu5225_3.jpg"]

piece_7_imgs = ["https://images.asos-media.com/products/lacoste-x-polaroid-polo-a-rayures-multicolore/23085875-3?$n_640w$&wid=513&fit=constrain"]

piece_8_imgs = ["https://www.pimkie.fr/dw/image/v2/AAYN_PRD/on/demandware.static/-/Sites-pimkie-master-catalog/default/dwdc0fd435/images/562641_912A09_portrait_HD_1.JPG?sw=592&sh=731"]

piece_9_imgs = ["https://www.whiteonebridal.com/media/catalog/product/d/e/delite_b.jpg?quality=80&bg-color=255,255,255&fit=bounds&height=747&width=560&canvas=560:747"]

piece_10_imgs = ["https://i.pinimg.com/originals/08/38/0e/08380e0dac9b750fef119f8f7eedb21e.jpg"]

piece_11_imgs = ["https://i.pinimg.com/736x/9d/12/f9/9d12f90fb7e9535a9921387433b9853f.jpg"]

piece_12_imgs = ["https://prettywire.fr/74039-thickbox_default/tommy-vert-pantalon-lurex.jpg"]

piece_13_imgs = ["https://prettywire.fr/53184-thickbox_default/milo-blanc-pantalon-a-pinces.jpg", "https://prettywire.fr/53183-thickbox_default/milo-blanc-pantalon-a-pinces.jpg", "https://prettywire.fr/53186-thickbox_default/milo-blanc-pantalon-a-pinces.jpg", "https://prettywire.fr/53187-thickbox_default/milo-blanc-pantalon-a-pinces.jpg", "https://prettywire.fr/53185-thickbox_default/milo-blanc-pantalon-a-pinces.jpg"]

piece_14_imgs = ["https://prettywire.fr/72575-thickbox_default/milo-noir-pantalon-a-pinces.jpg", "https://prettywire.fr/72578-thickbox_default/milo-noir-pantalon-a-pinces.jpg", "https://prettywire.fr/71716-thickbox_default/milo-noir-pantalon-a-pinces.jpg", "https://prettywire.fr/72578-thickbox_default/milo-noir-pantalon-a-pinces.jpg", "https://prettywire.fr/71718-thickbox_default/milo-noir-pantalon-a-pinces.jpg"]

piece_15_imgs = ["https://prettywire.fr/69688-thickbox_default/elisa-kaki-trench-oversize.jpg", "https://prettywire.fr/69701-thickbox_default/elisa-kaki-trench-oversize.jpg", "https://prettywire.fr/69690-thickbox_default/elisa-kaki-trench-oversize.jpg", "https://prettywire.fr/69689-thickbox_default/elisa-kaki-trench-oversize.jpg", "https://prettywire.fr/69695-thickbox_default/elisa-kaki-trench-oversize.jpg"]

piece_16_imgs = ["https://prettywire.fr/73301-thickbox_default/gary-ecru-pull-camionneur.jpg", "https://prettywire.fr/73300-thickbox_default/gary-ecru-pull-camionneur.jpg", "https://prettywire.fr/73299-thickbox_default/gary-ecru-pull-camionneur.jpg", "https://prettywire.fr/73306-thickbox_default/gary-ecru-pull-camionneur.jpg", "https://prettywire.fr/73304-thickbox_default/gary-ecru-pull-camionneur.jpg"]

piece_17_imgs = ["https://prettywire.fr/74202-thickbox_default/izao-doree-robe-lurex.jpg","https://prettywire.fr/74207-thickbox_default/izao-doree-robe-lurex.jpg","https://prettywire.fr/74201-thickbox_default/izao-doree-robe-lurex.jpg","https://prettywire.fr/74208-thickbox_default/izao-doree-robe-lurex.jpg","https://prettywire.fr/74206-thickbox_default/izao-doree-robe-lurex.jpg"]

piece_18_imgs = ["https://prettywire.fr/73989-thickbox_default/strass-argentee-robe-.jpg", "https://prettywire.fr/73985-thickbox_default/strass-argentee-robe-.jpg", "https://prettywire.fr/73991-thickbox_default/strass-argentee-robe-.jpg", "https://prettywire.fr/73991-thickbox_default/strass-argentee-robe-.jpg", "https://prettywire.fr/73998-thickbox_default/strass-argentee-robe-.jpg"]

piece_19_imgs = ["https://images.asos-media.com/products/asos-design-button-through-ruched-waist-pleated-midi-dress-in-metallic-dobby-in-deep-red/200959875-1-deepred?$n_750w$&wid=750&fit=constrain"]

piece_20_imgs = ["https://images.asos-media.com/products/asos-deisgn-puff-sleeve-top-with-rouleau-button-detail-co-ord-in-purple-floral-print/204609205-1-purple?$n_640w$&wid=513&fit=constrain"]

piece_21_imgs = ["https://images.asos-media.com/products/asos-design-pencil-midi-dress-with-ruffle-detail-in-smudge-print/202893918-1-multi?$n_640w$&wid=513&fit=constrain"]

piece_22_imgs = ["https://media.thereformation.com/image/upload/f_auto,q_auto,dpr_2.0/w_400,c_scale//PRD-SFCC/1305735/BLACK/1305735.2.BLACK?_s=RAABAB0"]

piece_23_imgs = ["https://images.asos-media.com/products/asos-design-robe-courte-en-satin-plisse-a-col-montant/201125223-4?$n_640w$&wid=513&fit=constrain"]

images = [piece_1_imgs, piece_2_imgs, piece_3_imgs, piece_4_imgs, piece_5_imgs, piece_6_imgs, piece_7_imgs, piece_8_imgs, piece_9_imgs, piece_10_imgs, piece_11_imgs, piece_12_imgs, piece_13_imgs, piece_14_imgs, piece_15_imgs, piece_16_imgs, piece_17_imgs, piece_18_imgs, piece_19_imgs, piece_20_imgs, piece_21_imgs, piece_22_imgs, piece_23_imgs]
image_index = 0

puts 'Creating pieces...'
[piece_1, piece_2, piece_3, piece_4, piece_5, piece_6, piece_7, piece_8, piece_9, piece_10, piece_11, piece_12, piece_13, piece_14, piece_15, piece_16, piece_17, piece_18, piece_19, piece_20, piece_21, piece_22, piece_23].each do |attributes|
  piece = Piece.new(attributes)
  piece_images = images[image_index]
  piece_image_index = 0
  piece_images.each do |image|
    file = URI.open(image)
    piece.photos.attach(io: file, filename: "#{piece.name}#{piece_image_index}.png", content_type: "image/png")
    piece_image_index += 1
    end
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
  # renting = User.where.not(first_name: "Joana").sample
  renting = User.where.not(first_name: "Joana").sample
  piece = Piece.where.not(user: renting).sample
  total_price = (piece.price_per_day * (end_date - start_date))
  transaction = Transaction.create(user_id: renting.id, piece_id: piece.id, start_date:, end_date:, status: "pending", total_price:)
  puts "Created transaction number #{transaction.id}"
end

# [transaction_2].each do |attributes|
#   transaction = Transaction.create!(attributes)
#   puts "Created #{transaction.id}"
# end
puts "Finished with transactions!"
