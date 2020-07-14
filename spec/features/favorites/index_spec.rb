RSpec.describe 'Index Page' do
  it 'should show all favorites' do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    favorite1 = Favorite.create(pet_id: cat1.id)
    favorite2 = Favorite.create(pet_id: cat2.id)
    visit '/favorites'
    expect(page).to have_content("2")
    expect(page).to have_content("")
    click_on 'Gordo'
    expect(current_path).to eq("/pets/#{cat2.id}")
  end

  it 'should remove a favorite from favorites page' do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    favorite1 = Favorite.create(pet_id: cat1.id)
    visit '/favorites'
    click_on "Remove Me From Your Favorites"
    expect(current_path).to eq("/favorites")
    within('nav'){expect(page).to have_content('0')}
    expect(page).to_not have_content('Fred')
  end

  it 'I see text saying that I have no favorited pets' do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    visit '/favorites'
    expect(page).to have_content("You have not favorited any pets!")
  end

  it 'Removes all Favorites from Favorites Page' do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    favorite1 = Favorite.create(pet_id: cat2.id)
    favorite2 = Favorite.create(pet_id: cat2.id)
    visit '/favorites'
    click_on "Remove ALL Favorites"
    expect(current_path).to eq('/favorites')
    expect(page).to have_content("You have not favorited any pets!")
  end

  it "clicks a link going to a form to adopt favorited pets" do
  cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
  cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
  cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
  cat3 = Pet.create(name: 'Jinx', approx_age: 5, sex: "Female", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Jinx is a very friendly cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
  name = "Kathy"
  address = "123 Main Rd"
  city = "Denver"
  state = "CO"
  zip = "80207"
  number = "123-456-6789"
  description = "I have a big backyard to play in."
  favorite1 = Favorite.create(pet_id: cat1.id)
  favorite2 = Favorite.create(pet_id: cat2.id)
  visit '/favorites'
  click_on "Adopt A Pet"
  expect(current_path).to eq('/applications/new')
  check "Fred"
  check "Gordo"
  fill_in :name, with: name
  fill_in :address, with: address
  fill_in :city, with: city
  fill_in :state, with: state
  fill_in :zip, with: zip
  fill_in :phone_number, with: number
  fill_in :description, with: description
  click_on "Submit Application"
  expect(page).to have_content("Application Submitted!")
  expect(current_path).to eq("/favorites")
  within(".viewable_favorites") do
  expect(page).to_not have_content(cat1.name)
  expect(page).to_not have_content(cat2.name)
  end
end

it "cannot submit application if information is missing" do
  cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
  cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
  cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
  cat3 = Pet.create(name: 'Jinx', approx_age: 5, sex: "Female", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Jinx is a very friendly cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
  favorite1 = Favorite.create(pet_id: cat1.id)
  favorite2 = Favorite.create(pet_id: cat2.id)
  visit '/favorites'
  click_on "Adopt A Pet"
  expect(current_path).to eq('/applications/new')
  check "Fred"
  check "Gordo"
  click_on "Submit Application"
  expect(page).to have_content("Application was not submitted successfully")
  expect(current_path).to eq("/applications/new")
end

  it "shows a list of pets with applications" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    cat3 = Pet.create(name: 'Jinx', approx_age: 5, sex: "Female", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Jinx is a very friendly cat!", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    name = "Kathy"
    address = "123 Main Rd"
    city = "Denver"
    state = "CO"
    zip = "80207"
    number = "123-456-6789"
    description = "I have a big backyard to play in."
    favorite1 = Favorite.create(pet_id: cat1.id)
    favorite2 = Favorite.create(pet_id: cat2.id)
    favorite3 = Favorite.create(pet_id: cat3.id)
    visit '/favorites'
    click_on "Adopt A Pet"
    expect(current_path).to eq('/applications/new')
    check "Fred"
    check "Gordo"
    fill_in :name, with: name
    fill_in :address, with: address
    fill_in :city, with: city
    fill_in :state, with: state
    fill_in :zip, with: zip
    fill_in :phone_number, with: number
    fill_in :description, with: description
    click_on "Submit Application"

    within(".application_favorites") do
      expect(page).to_not have_link(cat3.name)
      expect(page).to have_link(cat1.name)
      expect(page).to have_link(cat2.name)
      click_on "Fred"
      expect(current_path).to eq("/pets/#{cat1.id}")
    end
  end
  
end
