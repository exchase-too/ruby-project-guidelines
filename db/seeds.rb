User.destroy_all
Car.destroy_all
Purchase.destroy_all

u1 = User.create(name: "George")
u2 = User.create(name: "Mike")
u3 = User.create(name: "Steve")
u4 = User.create(name: "Janice")
u5 = User.create(name: "Sally")

c1 = Car.create(model: "Toyota Camry", price: "15000", car_type:"sedan")
c2 = Car.create(model: "Chevy Camaro", price: "10000", car_type:"coupe")
c3 = Car.create(model: "Ford F-150", price: "35000", car_type:"truck")
c4 = Car.create(model: "Toyoya Sienna", price: "15000", car_type:"minivan")
c5 = Car.create(model: "Toyota Camry", price: "15000", car_type:"sedan")
c6 = Car.create(model: "Chevy Camaro", price: "10000", car_type:"coupe")
c7 = Car.create(model: "Ford F-150", price: "35000", car_type:"truck")
c8 = Car.create(model: "Toyoya Sienna", price: "15000", car_type:"minivan")
c9 = Car.create(model: "Toyota Camry", price: "15000", car_type:"sedan")
c10 = Car.create(model: "Chevy Camaro", price: "10000", car_type:"coupe")
c11 = Car.create(model: "Ford F-150", price: "35000", car_type:"truck")
c12 = Car.create(model: "Toyoya Sienna", price: "15000", car_type:"minivan")

p1 = Purchase.create(car_id: c1.id, user_id: u1.id)