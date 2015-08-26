# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
Product.create! id: 1, name: "DJI Phantom", price: 2000.00, image_url: "/djiphantom.jpg", active: true
Product.create! id: 2, name: "3DR Iris", price: 600.00, image_url: "/3driris.jpg" ,active: true
Product.create! id: 3, name: "Parrot PF725100", price: 900.00, image_url:"/parrotpf72.jpg" ,active: true
Product.create! id: 4, name: "Parrot Power Edition", price: 400.00, image_url: "/parrotpower.jpg" ,active: true
Product.create! id: 5, name: "Blade 350 QX3", price: 400.00, image_url: "/blade350.jpeg" ,active: true
Product.create! id: 6, name: "Hero V626", price: 150.00, image_url: "/herov626.jpeg" ,active: true
Product.create! id: 7, name: "Haktoys HAK907", price: 70.00, image_url: "/haktoys.jpg" ,active: true
Product.create! id: 8, name: "Ei-Hi S911C", price: 200.00, image_url: "/eihi.jpg" ,active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"