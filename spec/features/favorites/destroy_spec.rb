RSpec.describe 'Destroy Favorite' do
  it "doesn't have a favorite link if I've already favorited it" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    favorite1 = Favorite.create(pet_id: cat1.id)
    favorite2 = Favorite.create(pet_id: cat2.id)
    visit "/pets/#{cat1.id}"
    expect(page).to_not have_content("FAVORITE ME")
    click_on "Remove me from your favorites"
    expect(current_path).to eq("/pets/#{cat1.id}")
    expect(page).to have_content("You successfully removed this pet from your favorites")
    expect(page).to have_link("FAVORITE ME")
    within('nav'){expect(page).to have_content('1')}
  end


end
