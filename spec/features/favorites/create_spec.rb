RSpec.describe 'Create a Favorite' do
  it 'should show all favorites' do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "", description: "Gordo is so fluffy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    visit "/pets/#{cat1.id}"
    click_link "FAVORITE ME"
    expect(current_path).to eq("/pets/#{cat1.id}")
    expect(page).to have_content("I've been added to your favorites list!")
    expect(page).to have_content("Favorite Indicator: 1")
  end
end