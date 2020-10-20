User.destroy_all
Car.destroy_all
Purchase.destroy_all

u1 = User.create(name: "George")
u2 = User.create(name: "Mike")
u3 = User.create(name: "Steve")
u4 = User.create(name: "Janice")
u5 = User.create(name: "Sally")

c1 = Car.create(name: "Toyota Camry", price: "15000", type:"sedan")
c2 = Car.create(name: "Chevy Camaro", price: "10000", type:"coupe")
c3 = Car.create(name: "Ford F-150", price: "35000", type:"truck")
c4 = Car.create(name: "Mazda MX-5", price: "20000", type:"coupe")
c5 = Car.create(name: "Old Beater", price: "500", type:"sedan")
c6 = Car.create(name: "Hyperion Excess", price: "1500000", type:"sedan")
c7 = Car.create(name: "Lamborghini Countach", price: "250000", type:"coupe")
c8 = Car.create(name: "Nissan Altima", price: "5000", type:"sedan")
c9 = Car.create(name: "Toyoya Sienna", price: "15000", type:"minivan")
c10 = Car.create(name: "Chrysler Vanthing", price: "15000", type:"minivan")

p1 = Purchase.create(c1.id, u1.id) #???)