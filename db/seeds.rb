
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

url = URI("https://google-image-search1.p.rapidapi.com/v2/?q=shopentrance&hl=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = '57512428ddmsh07e85c992179973p1be0b5jsn264f36b6b188'
request["X-RapidAPI-Host"] = 'google-image-search1.p.rapidapi.com'

response = http.request(request)
response = JSON.parse(response.body)
puts "Creating stores..."
(1..20).each_with_index do |x, index|
  a = Store.new(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    opening_hour: Faker::Time.backward(days: 5, period: :morning, format: :short),
    closing_hour: Faker::Time.backward(days: 5, period: :evening, format: :short),
    user_id: owner.id
  )
  url = response["response"]["images"][index]["thumbnail"]["url"]
  file_aux = URI.open(url)
  a.photo.attach(io: file_aux, filename: "photoshop#{index}.png", content_type: "image/png")
  a.save
end
puts "Stores created!!!"
puts "\n"

url = URI("https://google-image-search1.p.rapidapi.com/v2/?q=clothes&hl=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = '57512428ddmsh07e85c992179973p1be0b5jsn264f36b6b188'
request["X-RapidAPI-Host"] = 'google-image-search1.p.rapidapi.com'

response = http.request(request)
response = JSON.parse(response.body)



puts "Creating products"
Store.all.each do |store|
  number = (1..8).to_a.sample
  (1..number).each_with_index do |_x, index|
    a = Product.new(
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price,
      discount: (1..50).to_a.sample,
      store_id: store.id
    )
    product = response["response"]["images"][index]
    product = response["response"]["images"][rand(1..8)] while product.nil?
    url = product["thumbnail"]["url"]
    file_aux = URI.open(url)
    a.photo.attach(io: file_aux, filename: "photo#{index}.png", content_type: "image/png")
    a.save
  end
end
puts "Products created!!!"
puts "\n"
puts "Creating reviews..."
Store.all.each do |store|
  number = (1..15).to_a.sample
  userId = User.all.map { |user| user.id}
  (1..number).each do
    Review.create(
      rating: (1..5).to_a.sample,
      content: Faker::Lorem.paragraph,
      user_id: User.find_by(id: userId.sample).id,
      store_id: store.id
    )
  end
end
puts "Reviews created!!!"
