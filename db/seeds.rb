User.destroy_all
Car.destroy_all
Purchase.destroy_all

u1 = User.create(name: "George")
u2 = User.create(name: "Mike")
u3 = User.create(name: "Steve")
u4 = User.create(name: "Janice")
u5 = User.create(name: "Sally")

c1 = Car.create(model: "Toyota Camry", price: "15000", car_type:"sedan", color:"red", trim_level:"base")
c2 = Car.create(model: "Chevy Camaro", price: "10000", car_type:"coupe", color:"black", trim_level:"deluxe")
c3 = Car.create(model: "Ford F-150", price: "35000", car_type:"truck", color:"white", trim_level:"base")
c4 = Car.create(model: "Toyoya Sienna", price: "15000", car_type:"minivan", color:"red", trim_level:"deluxe")
c5 = Car.create(model: "Toyota Camry", price: "15000", car_type:"sedan", color:"black", trim_level:"base")
c6 = Car.create(model: "Chevy Camaro", price: "10000", car_type:"coupe", color:"red", trim_level:"deluxe")
c7 = Car.create(model: "Ford F-150", price: "35000", car_type:"truck", color:"red", trim_level:"base")
c8 = Car.create(model: "Toyoya Sienna", price: "15000", car_type:"minivan", color:"black", trim_level:"deluxe")
c9 = Car.create(model: "Toyota Camry", price: "15000", car_type:"sedan", color:"white", trim_level:"base")
c10 = Car.create(model: "Chevy Camaro", price: "10000", car_type:"coupe", color:"white", trim_level:"deluxe")
c11 = Car.create(model: "Ford F-150", price: "35000", car_type:"truck", color:"black", trim_level:"deluxe")
c12 = Car.create(model: "Toyoya Sienna", price: "15000", car_type:"minivan", color:"white", trim_level:"base")
