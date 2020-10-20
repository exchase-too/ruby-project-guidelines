require_relative '../config/environment'
require_relative '../app/models/car'
require_relative '../app/models/purchase'
require_relative '../app/models/user'

puts "HELLO WORLD"

u1 = User.create(name: "George")
c1 = Car.create(model: "Toyota Camry", price: "15000", type:"sedan")
p1 = Purchase.create(car_id: c1.id, user_id: u1.id)
