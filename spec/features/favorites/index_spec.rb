RSpec.describe 'Index Page' do
  it 'shoud show all favorites' do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "", description: "Gordo is so fluffy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    favorite1 = Favorite.create(pet_id: cat1.id)
    favorite2 = Favorite.create(pet_id: cat2.id)
    visit '/favorites'
    expect(page).to have_content("2")
  end
end
