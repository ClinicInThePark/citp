# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(name:"example",email:"example@example.com",password:"foobar",password_confirmation:"foobar")
Booth.create(name:"Healthy Smiles",service:"fluoride cleaning",description:"dental")
Booth.create(name:"OCPD",service:"OC police",description:"alcohol talk")
Booth.create(name:"UCI med center",service:"UCI Med",description:"health talk")
Event.create(date:"2015-02-01",location:"OC Great Park",boothlist:["1","2","3"])