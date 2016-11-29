# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


 Booking.destroy_all
 Bike.destroy_all
 User.destroy_all

 owner = User.create!(first_name: "bob", email: "bob@bob.com", password: "123456", password_confirmation: "123456")
 renter = User.create!(first_name: "alice", email: "alicce@alice.com", password: "123456", password_confirmation: "123456")
 bike = Bike.create(brand:"peugeot", user: owner, title: "Mon super velo", detail: "
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo nemo corporis, quis sequi necessitatibus, laborum deleniti facilis id quae officiis. Dolorum et officia nemo a accusamus illum provident quaerat placeat!", )
 booking =  Booking.new
 booking.user = renter
 booking.bike = bike
 booking.save!

user1 = User.create!(first_name:"Bob", email:"test@free.fr", password:"hzbdizhdb", password_confirmation:"hzbdizhdb")


bike1 = Bike.create!(city:"Nantes", brand:"Peugeot", title:"Vélo de collection", detail:"Lorem ipsum dolor sit amet, consectetur adipisicing elit.", user_id: user1.id)
bike2 = Bike.create!(city:"Bordeaux", brand:"Scott", title:"VTT 29\" semi rigide", detail:"Lorem ipsum dolor sit amet, consectetur adipisicing elit.", user_id: user1.id)
bike3 = Bike.create!(city:"Amsterdam", brand:"Specialized", title:"VTT 29\" tout supendu", detail:"Lorem ipsum dolor sit amet, consectetur adipisicing elit.", user_id: user1.id)
bike4 = Bike.create!(city:"Cherbourg", brand:"Commencal", title:"VTT 29\" semi rigide", detail:"Lorem ipsum dolor sit amet, consectetur adipisicing elit.", user_id: user1.id)
bike5 = Bike.create!(city:"Paris", brand:"Canyon", title:"VTT 29\" semi rigide", detail:"Lorem ipsum dolor sit amet, consectetur adipisicing elit.", user_id: user1.id)
bike6 = Bike.create!(city:"Nantes", brand:"Peugeot", title:"VTT 29\" semi rigide", detail:"Lorem ipsum dolor sit amet, consectetur adipisicing elit.", user_id: user1.id)
