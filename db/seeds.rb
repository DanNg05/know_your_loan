# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end





























dan_user = User.create(email: "dan@gmail.com", password: "123456", admin: false)
admin = User.create(email: "admin@gmail.com", password: "123456", admin: true)
broker_1 = Broker.create(first_name: "Dan", last_name: "Nguyen", email: "bestbrokerAU@gmail.com", phone_number: "0411383838", about: "Dan is well and truly one of our championed brokers at AU BEST BROKER. He’s a huge asset to the AU BEST BROKER family, providing wonderful lending advice to his South Australia community and beyond.", address: "211 Payneham Rd St Peters SA 5069")
broker_2 = Broker.create(first_name: "Carly", last_name: "Cawthorne", email: "2ndbestbrokerAU@gmail.com", phone_number: "0466575757", about: "Carly is the type of broker who takes extra care and time to listen to the specific needs of her clients. She invites all questions from her clients and provides careful advice to ensure her clients are comfortable and well-versed.", address: "11 Hutt Street Adelaide SA 5000")
broker_3 = Broker.create(first_name: "Cassandra", last_name: "Stoodley", email: "3ndbestbrokerAU@gmail.com", phone_number: "0466112233", about: "Cassandra is undoubtably the backbone of the Bernie Lewis South Coast crew. She sets out to empower her clients through improving their financial knowledge, so they can make the right decisions for their circumstances.", address: "23 Swift Ave, Dulwich SA 5065")
