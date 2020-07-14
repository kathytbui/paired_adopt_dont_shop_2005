# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#shelters
cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
playful_pups = Shelter.create(name: "Playful Puppies Animal Shelter")

#pets
cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
cat3 = Pet.create(name: 'Jinx', approx_age: 5, sex: "Female", image: "", description: "Jinx is a very friendly cat!", adoption_status: "Adoptable", shelter_id: playful_pups.id)

favorite1 = Favorite.create(pet_id: cat1.id)
favorite2 = Favorite.create(pet_id: cat2.id)

application1 = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")
application2 = Applications.create(name: "Neeru", address: "123 Pleasant Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I like animals.")
application3 = Applications.create(name: "Judith", address: "123 Pleasant Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I like animals.")

ApplicationsPet.create(applications: application1, pet: cat1)
ApplicationsPet.create(applications: application2, pet: cat1)
ApplicationsPet.create(applications: application3, pet: cat1)
ApplicationsPet.create(applications: application1, pet: cat2)
ApplicationsPet.create(applications: application1, pet: cat3)
