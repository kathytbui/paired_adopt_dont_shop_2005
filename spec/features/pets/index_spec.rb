RSpec.describe 'as a visitor' do
  describe 'when I visit /pets' do
    it 'then I see a lit of all pets including all their attributes' do
      shelter = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
      cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: shelter.id, description: "Very cute but ferocious cat" )
      cat2 = Pet.create(name: 'Sophie', approx_age: 6, sex: "Female", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: shelter.id, description: "Very cute but ferocious cat" )
      visit '/pets'
      expect(page).to have_content("FRED")
      expect(page).to have_content("#{cat1.approx_age}")
      expect(page).to have_content("#{cat1.sex}")
      expect(page).to have_css("img[src=\"#{cat1.image}\"]")
      expect(page).to have_content("#{shelter.name.upcase}")
      expect(page).to have_content("SOPHIE")
      expect(page).to have_content("#{cat2.approx_age}")
      expect(page).to have_content("#{cat2.sex}")
      expect(page).to have_css("img[src=\"#{cat2.image}\"]")

    end
  end

  describe "When I visit /pets I see a link to edit pet info next to every pet"
    it "When I click the link I'm taken to a page to edit pet's info" do
      shelter = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
      cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: shelter.id, description: "Very cute but ferocious cat" )
      visit '/pets'
      click_link "EDIT #{cat1.name.upcase}'S INFO"
      expect(current_path).to eq("/pets/#{cat1.id}/edit")
  end

  describe "When I visit /pets I see a link to delete pet next to every pet"
    it "When I click the link the pet is deleted and I no longer see the page on the pet index page" do
      shelter = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
      cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: shelter.id, description: "Very cute but ferocious cat")
      visit '/pets'
      click_link "DELETE #{cat1.name.upcase}"
      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("Fred")
    end

  it "Has a link to shelter index page" do
    shelter = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: shelter.id, description: "Very cute but ferocious cat" )
    cat2 = Pet.create(name: 'Sophie', approx_age: 6, sex: "Female", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: shelter.id, description: "Very cute but ferocious cat" )
    visit '/pets'
    expect(page).to have_link("ALL SHELTERS")
  end

  it "Each pet's name links to their show page" do
    shelter = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: shelter.id, description: "Very cute but ferocious cat" )
    cat2 = Pet.create(name: 'Sophie', approx_age: 6, sex: "Female", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: shelter.id, description: "Very cute but ferocious cat" )
    visit '/pets'
    expect(page).to have_link("#{cat1.name.upcase}")
    expect(page).to have_link("#{cat2.name.upcase}")
  end

  it "Each shelter's name links to their show page" do
    shelter = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: shelter.id, description: "Very cute but ferocious cat" )
    cat2 = Pet.create(name: 'Sophie', approx_age: 6, sex: "Female", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: shelter.id, description: "Very cute but ferocious cat" )
    visit '/pets'
    expect(page).to have_link("#{shelter.name.upcase}")
  end

  it "Has a favorite indicator in the nav" do
    shelter = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: shelter.id )
    cat2 = Pet.create(name: 'Sophie', approx_age: 6, sex: "Female", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: shelter.id )
    visit "/pets"
    expect(page).to have_content("Favorite Indicator")
  end
end
