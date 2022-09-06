require 'uri'
require 'net/http'
require 'openssl'
require 'json'


puts "Deleting old seeds..."
Review.destroy_all
Product.destroy_all
Store.destroy_all
User.destroy_all
puts "Old seeds deleted!!!"
puts "\n"

puts "Creating users..."
user1 = User.create(first_name: "Natalia", last_name: "Quintero", birthdate: "1990-08-15", username: "natalia", email: "natalia@gmail.com", password: "123456")
user2 = User.create(first_name: "Diego", last_name: "Rodriguez", birthdate: "2000-07-28", username: "diego", email: "diego@gmail.com", password: "123456")
user3 = User.create(first_name: "Johnson", last_name: "Perez", birthdate: "1995-01-09", username: "johnson", email: "jonhson@gmail.com", password: "123456")
owner = User.create(first_name: "Owner", last_name: "Owner", birthdate: "1981-01-09", username: "owner", email: "owner@gmail.com", password: "123456")
puts "Users created!!!"
puts "\n"
puts "Creating stores..."

primark_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipNoPxscFzruRbTNR56Gsxw7XH93pwjaiX8IuAgQ=w424-h240-k-no")
hm_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipM9qEpE4rNNVL10L-qiT8LXpR8Oi4Y7VlukKg49=w408-h276-k-no")
depot_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipN1wpNvR5d2ck_sWNs5T9E3tMZCLvIoa-6ooHre=w408-h272-k-no")
steiff_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipOPcmEy8RiVV3bN6p_xMuws1fFZSlPvg4VrY0vP=w408-h306-k-no")
lacoste_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipN4RR53q4SrDimP_BMBZ32_YHFN0G0rbvwpOeT9=w408-h272-k-no")
zarahome_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipMFN493-ZRyRh48KwqelfHOvB30YOJwxIW8fi7T=w408-h306-k-no")
overkill_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipP9k3W4_WOr0BkTaOTzvTXGfS1sUzgptqo4MYBX=w408-h271-k-no")
butler_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipMzYArnvopsv5gg7xMwK1IYQ29pCF5aKKJf5w0N=w426-h240-k-no")
optik_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipMOv6F9tjpwjOdHM00t7njelKbbG23A1fuvddIr=w408-h544-k-no")
vintage_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipOVqmUwQZH945mHx1MYBlJoeZkEwkb1DHmW0xbg=w408-h544-k-no")
boogs_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipMoMNHPll0FsVXtnRfQAypH_n2PdrP6eXb9dkti=w408-h272-k-no")
icrush_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipPGttZlj_dgTSUmYJECZJfKtR_G473Hee6eNw3g=w408-h306-k-no")
ludwig_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipPGKklAtM_63EzKjp3JK3hBL4qy0r740DTpOQvX=w426-h240-k-no")
whisky_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipNOnewj-gqHTD3rEnSUg0gB9r1TvCo_26wzBDYy=w426-h240-k-no")
stoff_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipPRXZkRfb19a-hIqWU4iq-L9KJiLNhtXEwR0hfs=w426-h240-k-no")
dufthaus_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipOcBBqM7D-jLKvJorevG-YLwouxZx4RRrpeBmR9=w426-h240-k-no")
ca_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipOeIY97e4nlkrU82hDg8N_5DHcP-zGb9oNabLoo=w408-h544-k-no")
bershka_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipNzjSpedsXcaliQK_bs95X1Ko01_m_pyBhRRlaF=w408-h544-k-no")
calvin_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipNADY-UmfAwv_e_8U-haF_uM3_rzdp5dDRxV6le=w426-h240-k-no")
sport_store = URI.open("https://lh5.googleusercontent.com/p/AF1QipP_23het-zMKKmy_yukjatDzGWxf9KNucg3IY4b=w408-h543-k-no")

primark_product = URI.open("https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7a9b2c6bb14f4b108a27a9d300abc4fe_9366/3-STRIPES_CUSHIONED_CREW_SOCKS_3_PAIRS_White_DZ9346_03_standard.jpg")
hm_product = URI.open("https://img.ltwebstatic.com/images3_pi/2021/11/09/1636455624b80016229255cb33d73d01456b8c0fab_thumbnail_900x.webp")
depot_product = URI.open("https://www.depotmaletools.com/wp-content/uploads/2020/05/depot-uomo.jpg")
steiff_product = URI.open("https://www.steiff.com/img/310/300/resize/catalog/product/s/o/soft-cuddly-friends-honey-teddybaer-113482-3.jpg")
lacoste_product = URI.open("https://lac-sk.akinoncdn.com/products/2022/03/02/174495/1f50acbc-56a1-49ba-9e1f-ca648858e228.jpg")
zarahome_product = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZhOGMyat-L881YqU8zACaBGlklJwBbMf0V_B4qPE4k0B6AIyrVjTsDvQkpQW-M1_A8_M&usqp=CAU")
overkill_product = URI.open("https://www.overkillshop.com/media/catalog/product/cache/2/small_image/300x/9df78eab33525d08d6e5fb8d27136e95/o/k/ok-bl-hoodie-blau_1.jpg")
butler_product = URI.open("https://www.kleiderbuegelprofi.de/media/catalog/product/cache/1/small_image/265x265/9df78eab33525d08d6e5fb8d27136e95/4/6/4655_cobra_2.jpg")
optik_product = URI.open("https://www.city-optik-muenchen.de/wp-content/uploads/Kontaktlinsen-e1621607119812.jpg")
vintage_product = URI.open("https://cdnimg.emmiol.com/E/202012/img_original-EAL0100BO-27231216310.jpg")
boogs_product = URI.open("https://boogs-home.com/wp-content/uploads/2020/12/39904_Product-500x500.jpg")
icrush_product = URI.open("https://icrush.de/wp-content/uploads/2022/08/OE0665S.2jpg-510x680.jpg")
ludwig_product = URI.open("https://www.barhocker.de/media/catalog/product/B/a/Barhocker_Koeln_Stoff__1_2.jpg")
whisky_product = URI.open("https://pittermanns.de/wp-content/uploads/2021/02/Pittermanns-Produktfotos-20-CL_Single_Malt_Whisky.png")
stoff_product = URI.open("https://tweedandgreet.de/wp-content/uploads/2015/05/K%C3%A4the-Meier-Stoffladen-in-K%C3%B6ln-Art-Gallery-Stoffe.jpg")
dufthaus_product = URI.open("https://cdn-fohjf.nitrocdn.com/txLALySdVOJcduIKbdkVyCqkLpelzYVN/assets/static/optimized/rev-375e86b/media/catalog/product/cache/c25444b5db6b0a37ec5de7cd545145ac/F/l/Flakon_50ml_Base_711_684x1365.png")
ca_product = URI.open("https://www.c-and-a.com/img/product/q_auto:good,b_rgb:E0DEDA,c_scale,w_767/v1655463406/productimages/2176510-1-01.jpg")
bershka_product = URI.open("https://img01.ztat.net/article/spp-media-p1/45e807c28f30496ca37e623da6312cfb/0a8660c4fea14b83959d93d39240452b.jpg?imwidth=1800&filter=packshot")
calvin_product = URI.open("https://calvinklein-eu.scene7.com/is/image/CalvinKleinEU/J20J217714_BEH_alternate4?$main$")
sport_product = URI.open("https://tienda.clubdeportivotenerife.es/124-thickbox_default/camiseta-centenario-adulto.jpg")


store1 = Store.new(
  name: "Primark",
  address: "Neumarkt Galerie, Neumarkt 2-4, 50667 Köln",
  opening_hour: "10:00",
  closing_hour: "21:00",
  user_id: owner.id
)

store1.photo.attach(io: primark_store, filename: "primark.png", content_type: "image/png")
store1.save!

store2 = Store.new(
  name: "H&M",
  address: "Schildergasse 98-100, 50667 Köln",
  opening_hour: "09:00",
  closing_hour: "20:00",
  user_id: owner.id
)

store2.photo.attach(io: hm_store, filename: "hm.png", content_type: "image/png")
store2.save!

store3 = Store.new(
  name: "DEPOT",
  address: "Neumarkt 8-10, 50667 Köln",
  opening_hour: "09:30",
  closing_hour: "20:00",
  user_id: owner.id
)

store3.photo.attach(io: depot_store, filename: "depot.png", content_type: "image/png")
store3.save!

store4 = Store.new(
  name: "Steiff Shop Köln",
  address: "Neumarktpassage Neumarkt 18-20, 50667 Köln",
  opening_hour: "10:00",
  closing_hour: "19:00",
  user_id: owner.id
)

store4.photo.attach(io: steiff_store, filename: "steif.png", content_type: "image/png")
store4.save!

store5 = Store.new(
  name: "Lacoste",
  address: "Apostelnstraße 1-3, 50667 Köln",
  opening_hour: "10:00",
  closing_hour: "19:00",
  user_id: owner.id
)

store5.photo.attach(io: lacoste_store, filename: "lacoste.png", content_type: "image/png")
store5.save!

store6 = Store.new(
  name: "ZARA Home",
  address: "Mittelstraße 11, 50672 Köln",
  opening_hour: "10:00",
  closing_hour: "20:00",
  user_id: owner.id
)

store6.photo.attach(io: zarahome_store, filename: "zara.png", content_type: "image/png")
store6.save!

store7 = Store.new(
  name: "OVERKILL",
  address: "Hahnenstraße 20, 50667 Köln",
  opening_hour: "11:00",
  closing_hour: "20:00",
  user_id: owner.id
)

store7.photo.attach(io: overkill_store, filename: "overkill.png", content_type: "image/png")
store7.save!

store8 = Store.new(
  name: "BUTLERS",
  address: "Hohenzollernring 16-18, 50672 Köln",
  opening_hour: "10:00",
  closing_hour: "20:00",
  user_id: owner.id
)

store8.photo.attach(io: butler_store, filename: "butler.png", content_type: "image/png")
store8.save!

store9 = Store.new(
  name: "OPTIK OBERLÄNDER",
  address: "Ehrenstraße 71A, 50672 Köln",
  opening_hour: "10:00",
  closing_hour: "19:00",
  user_id: owner.id
)

store9.photo.attach(io: optik_store , filename: "optik.png", content_type: "image/png")
store9.save!

store10 = Store.new(
  name: "Vintage Revivals",
  address: "Ehrenstraße 96, 50672 Köln",
  opening_hour: "11:00",
  closing_hour: "19:00",
  user_id: owner.id
)

store10.photo.attach(io: vintage_store, filename: "vintage.png", content_type: "image/png")
store10.save!

store11 = Store.new(
  name: "Boog Home GmbH",
  address: "Ehrenstraße 84-86, 50672 Köln",
  opening_hour: "11:00",
  closing_hour: "19:00",
  user_id: owner.id
)

store11.photo.attach(io:boogs_store , filename: "boogs.png", content_type: "image/png")
store11.save!

store12 = Store.new(
  name: "ICRUSH-Flagshipstore",
  address: "Ehrenstraße 59, 50672 Köln",
  opening_hour: "11:00",
  closing_hour: "18:30",
  user_id: owner.id
)

store12.photo.attach(io:icrush_store , filename: "icrush.png", content_type: "image/png")
store12.save!

store13 = Store.new(
  name: "Lodwig",
  address: "Palmstraße 45, 50672 Köln",
  opening_hour: "12:00",
  closing_hour: "19:00",
  user_id: owner.id
)

store13.photo.attach(io:ludwig_store , filename: "ludwig.png", content_type: "image/png")
store13.save!

store14 = Store.new(
  name: "Scotch Whisky Shop",
  address: "Friesenstraße 16a, 50670 Köln",
  opening_hour: "11:00",
  closing_hour: "19:00",
  user_id: owner.id
)

store14.photo.attach(io: whisky_store , filename: "whisky.png", content_type: "image/png")
store14.save!

store15 = Store.new(
  name: "STOFF & STILL",
  address: "Auf dem Berlich 6, 50667 Köln",
  opening_hour: "10:00",
  closing_hour: "19:00",
  user_id: owner.id
)

store15.photo.attach(io: stoff_store, filename: "stoff.png", content_type: "image/png")
store15.save!

store16 = Store.new(
  name: "Dufthaus 4711",
  address: "Glockengasse 4, 50667 Köln",
  opening_hour: "09:30",
  closing_hour: "18:30",
  user_id: owner.id
)

store16.photo.attach(io: dufthaus_store, filename: "dufthaus.png", content_type: "image/png")
store16.save!

store17 = Store.new(
  name: "C&A",
  address: "Schildergasse 60-68, 50667 Köln",
  opening_hour: "09:30",
  closing_hour: "20:00",
  user_id: owner.id
)

store17.photo.attach(io: ca_store , filename: "ca.png", content_type: "image/png")
store17.save!

store18 = Store.new(
  name: "Bershka",
  address: "Schildergasse 46-48, 50667 Köln",
  opening_hour: "10:00",
  closing_hour: "20:00",
  user_id: owner.id
)

store18.photo.attach(io: bershka_store , filename: "bershka.png", content_type: "image/png")
store18.save!

store19 = Store.new(
  name: "Calvin Klein",
  address: "Schildergasse 55, 50667 Köln",
  opening_hour: "10:00",
  closing_hour: "20:00",
  user_id: owner.id
)

store19.photo.attach(io: calvin_store , filename: "calvin.png", content_type: "image/png")
store19.save!

store20 = Store.new(
  name: "SportScheck",
  address: "Schildergasse 38-42, 50667 Köln",
  opening_hour: "10:00",
  closing_hour: "20:00",
  user_id: owner.id
)

store20.photo.attach(io: sport_store, filename: "sport.png", content_type: "image/png")
store20.save!

puts "Stores created!!!"
puts "\n"
puts "Creating products..."


product1 = Product.new(
  name: "producto1",
  price: 10.50,
  discount: 25,
  store_id: store1.id
)
product1.photo.attach(io: primark_product , filename: "primark_product.png", content_type: "image/png")
product1.save!

product2 = Product.new(
  name: "producto1",
  price: 34,
  discount: 15,
  store_id: store2.id
)
product2.photo.attach(io: hm_product , filename: "hm_product.png", content_type: "image/png")
product2.save!

product3 = Product.new(
  name: "Socks",
  price: 40.85,
  discount: 50,
  store_id: store3.id
)
product3.photo.attach(io: depot_product , filename: "depot_product.png", content_type: "image/png")
product3.save!

product4 = Product.new(
  name: "producto1",
  price: 18.95,
  discount: 15,
  store_id: store4.id
)
product4.photo.attach(io: steiff_product , filename: "steiff_product.png", content_type: "image/png")
product4.save!

product5 = Product.new(
  name: "producto1",
  price: 80.75,
  discount: 25,
  store_id: store5.id
)
product5.photo.attach(io: lacoste_product , filename: "lacoste_product.png", content_type: "image/png")
product5.save!

product6 = Product.new(
  name: "producto1",
  price: 35.85,
  discount: 35,
  store_id: store6.id
)
product6.photo.attach(io: zarahome_product , filename: "zarahome_product.png", content_type: "image/png")
product6.save!

product7 = Product.new(
  name: "producto1",
  price: 90.50,
  discount: 45,
  store_id: store7.id
)
product7.photo.attach(io: overkill_product , filename: "overkill_product.png", content_type: "image/png")
product7.save!

product8 = Product.new(
  name: "producto1",
  price: 60.35,
  discount: 20,
  store_id: store8.id
)
product8.photo.attach(io: butler_product , filename: "butler_product.png", content_type: "image/png")
product8.save!

product9 = Product.new(
  name: "producto1",
  price: 50,
  discount: 15,
  store_id: store9.id
)
product9.photo.attach(io: optik_product , filename: "optik_product.png", content_type: "image/png")
product9.save!

product10 = Product.new(
  name: "producto1",
  price: 12.60,
  discount: 15,
  store_id: store10.id
)
product10.photo.attach(io: vintage_product , filename: "vintage_product.png", content_type: "image/png")
product10.save!

product11 = Product.new(
  name: "producto1",
  price: 80.75,
  discount: 40,
  store_id: store11.id
)
product11.photo.attach(io: boogs_product , filename: "boogs_product.png", content_type: "image/png")
product11.save!

product12 = Product.new(
  name: "producto1",
  price: 60.60,
  discount: 25,
  store_id: store12.id
)
product12.photo.attach(io: icrush_product , filename: "icrush_product.png", content_type: "image/png")
product12.save!

product13 = Product.new(
  name: "producto1",
  price: 34,
  discount: 30,
  store_id: store13.id
)
product13.photo.attach(io: ludwig_product , filename: "ludwig_product.png", content_type: "image/png")
product13.save!

product14 = Product.new(
  name: "producto1",
  price: 60.75,
  discount: 35,
  store_id: store14.id
)
product14.photo.attach(io: whisky_product , filename: "whisky_product.png", content_type: "image/png")
product14.save!

product15 = Product.new(
  name: "producto1",
  price: 20.25,
  discount: 30,
  store_id: store15.id
)
product15.photo.attach(io: stoff_product , filename: "stoff_product.png", content_type: "image/png")
product15.save!

product16 = Product.new(
  name: "producto1",
  price: 40.85,
  discount: 50,
  store_id: store16.id
)
product16.photo.attach(io: dufthaus_product , filename: "dufthaus_product.png", content_type: "image/png")
product16.save!

product17 = Product.new(
  name: "producto1",
  price: 78,
  discount: 55,
  store_id: store17.id
)
product17.photo.attach(io: ca_product , filename: "ca_product.png", content_type: "image/png")
product17.save!

product18 = Product.new(
  name: "producto1",
  price: 32.80,
  discount: 20,
  store_id: store18.id
)
product18.photo.attach(io: bershka_product , filename: "bershka_product.png", content_type: "image/png")
product18.save!

product19 = Product.new(
  name: "producto1",
  price: 44.50,
  discount: 40,
  store_id: store19.id
)
product19.photo.attach(io: calvin_product , filename: "calvin_product.png", content_type: "image/png")
product19.save!

product20 = Product.new(
  name: "producto1",
  price: 85,
  discount: 50,
  store_id: store20.id
)
product20.photo.attach(io: sport_product , filename: "sport_product.png", content_type: "image/png")
product20.save!

puts "Products created!!!"
puts "\n"
puts "Creating reviews..."

review1 = Review.new {
  rating: 3,
  content: "Good",
  user_id: owner.id,
  store_id: store1.id
}
review1.save!

review2 = Review.new {
  rating: 4,
  content: "g",
  user_id: owner.id,
  store_id: store2.id
}
review2.save!

review3 = Review.new {
  rating: 5,
  content: "g",
  user_id: owner.id,
  store_id: store3.id
}
review3.save!

review4 = Review.new {
  rating: 4,
  content: "g",
  user_id: owner.id,
  store_id: store4.id
}
review4.save!

review5 = Review.new {
  rating: 1,
  content: "g",
  user_id: owner.id,
  store_id: store5.id
}
review5.save!

review6 = Review.new {
  rating: 3,
  content: "Good",
  user_id: owner.id,
  store_id: store6.id
}
review6.save!

review7 = Review.new {
  rating: 2,
  content: "g",
  user_id: owner.id,
  store_id: store7.id
}
review7.save!

review8 = Review.new {
  rating: 1,
  content: "g",
  user_id: owner.id,
  store_id: store8.id
}
review8.save!

review9 = Review.new {
  rating: 2,
  content: "g",
  user_id: owner.id,
  store_id: store9.id
}
review9.save!

review10 = Review.new {
  rating: 3,
  content: "g",
  user_id: owner.id,
  store_id: store10.id
}
review10.save!

review11 = Review.new {
  rating: 4,
  content: "Good",
  user_id: owner.id,
  store_id: store11.id
}
review11.save!

review12 = Review.new {
  rating: 5,
  content: "g",
  user_id: owner.id,
  store_id: store12.id
}
review12.save!

review13 = Review.new {
  rating: 4,
  content: "g",
  user_id: owner.id,
  store_id: store13.id
}
review13.save!

review14 = Review.new {
  rating: 3,
  content: "g",
  user_id: owner.id,
  store_id: store14.id
}
review14.save!

review15 = Review.new {
  rating: 2,
  content: "g",
  user_id: owner.id,
  store_id: store15.id
}
review15.save!

review16 = Review.new {
  rating: 1,
  content: "Good",
  user_id: owner.id,
  store_id: store16.id
}
review16.save!

review17 = Review.new {
  rating: 2,
  content: "g",
  user_id: owner.id,
  store_id: store17.id
}
review17.save!

review18 = Review.new {
  rating: 3,
  content: "g",
  user_id: owner.id,
  store_id: store18.id
}
review18.save!

review19 = Review.new {
  rating: 4,
  content: "g",
  user_id: owner.id,
  store_id: store19.id
}
review19.save!

review20 = Review.new {
  rating: 5,
  content: "g",
  user_id: owner.id,
  store_id: store20.id
}
review20.save!





puts "Reviews created!!!"
