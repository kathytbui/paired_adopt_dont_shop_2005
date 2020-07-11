RSpec.describe 'Index Page' do
  it 'should show all favorites' do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    favorite1 = Favorite.create(pet_id: cat1.id)
    favorite2 = Favorite.create(pet_id: cat2.id)
    visit '/favorites'
    expect(page).to have_content("2")
    expect(page).to have_content("")
    click_on 'Gordo'
    expect(current_path).to eq("/pets/#{cat2.id}")
  end

  it 'should remove a favorite from favorites page' do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    favorite1 = Favorite.create(pet_id: cat1.id)
    visit '/favorites'
    click_on "Remove Me From Your Favorites"
    expect(current_path).to eq("/favorites")
    within('nav'){expect(page).to have_content('0')}
    expect(page).to_not have_content('Fred')
  end

  it 'I see text saying that I have no favorited pets' do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    visit '/favorites'
    expect(page).to have_content("You have not favorited any pets!")
  end

  it 'Removes all Favorites from Favorites Page' do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    visit '/favorites'
    click_on "Remove ALL Favorites"
    expect(current_path).to eq('/favorites')
    expect(page).to have_content("You have not favorited any pets!")
  end

  it "clicks a link going to a form to adopt favorited pets" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)

    click_on "Adopt A Pet"

    expect(current_path).to eq('applicant/new')

    

  end
end
