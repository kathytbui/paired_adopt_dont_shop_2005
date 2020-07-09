RSpec.describe "Shelter Pets index page" do
  it "When I visit '/shelters/:shelter_id/pets' I see all pets that can be adopted from that shelter" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    puppy_playground = Shelter.create(name: "The Puppy Playground", address: "125 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", shelter_id: cozy_kitten.id )
    cat2 = Pet.create(name: 'Sophie', approx_age: 6, sex: "Female", image: "", shelter_id: cozy_kitten.id )
    dog1 = Pet.create(name: 'Milo', approx_age: 3, sex: "Male", image: "", shelter_id: puppy_playground.id)
    visit "/shelters/#{cozy_kitten.id}/pets"
    expect(page).to have_content("FRED")
    expect(page).to have_content("#{cat1.approx_age}")
    expect(page).to have_content("#{cat1.sex}")
    expect(page).to have_content(cat1.image)
    expect(page).to have_content("SOPHIE")
    expect(page).to have_content("#{cat2.approx_age}")
    expect(page).to have_content("#{cat2.sex}")
    expect(page).to have_content(cat2.image)
    expect(page).to_not have_content("MILO")
    expect(page).to_not have_content("#{dog1.approx_age}")
  end

  describe "When I visit a shelter pets index page I see a link to edit pet info next to every pet"
    it "When I click the link I'm taken to a page to edit pet's info" do
      shelter = Shelter.create(name: "The Cozy Kitten Animal Shelter")
      cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", shelter_id: shelter.id )
      visit "/shelters/#{shelter.id}/pets"
      click_link "EDIT #{cat1.name.upcase}'S INFO"
      expect(current_path).to eq("/pets/#{cat1.id}/edit")
  end

  describe "When I visit a shelter pets index page I see a link to delete pet next to every pet"
    it "When I click the link the pet is deleted and I no longer see the page on the pet index page" do
      shelter = Shelter.create(name: "The Cozy Kitten Animal Shelter")
      cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", shelter_id: shelter.id )
      visit "shelters/#{shelter.id}/pets"
      click_link "DELETE #{cat1.name.upcase}"
    expect(current_path).to eq("/pets")
    expect(page).to_not have_content("FRED")
  end

  it "Has a link to pets index page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    visit "/shelters/#{cozy_kitten.id}/pets"
    expect(page).to have_link("ALL PETS")
  end

  it "Has a link to shelters index page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    visit "/shelters/#{cozy_kitten.id}/pets"
    expect(page).to have_link("ALL SHELTERS")
  end

  it "Each pet's name links to their show page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", shelter_id: cozy_kitten.id )
    cat2 = Pet.create(name: 'Sophie', approx_age: 6, sex: "Female", image: "", shelter_id: cozy_kitten.id )
    visit "/shelters/#{cozy_kitten.id}/pets"
    expect(page).to have_link("#{cat1.name.upcase}")
    expect(page).to have_link("#{cat2.name.upcase}")
  end

  it "Each shelter's name links to their show page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    visit "/shelters/#{cozy_kitten.id}/pets"
    expect(page).to have_link("#{cozy_kitten.name.upcase}")
  end

  it "It shows the count of pets that belong to that shelter" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", shelter_id: cozy_kitten.id )
    cat2 = Pet.create(name: 'Sophie', approx_age: 6, sex: "Female", image: "", shelter_id: cozy_kitten.id )
    visit "/shelters/#{cozy_kitten.id}/pets"
    expect(page).to have_content("NUMBER OF ADOPTABLE PETS:")
    expect(page).to have_content("2")
  end

  it "Has a favorite indicator in the nav" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", shelter_id: cozy_kitten.id )
    cat2 = Pet.create(name: 'Sophie', approx_age: 6, sex: "Female", image: "", shelter_id: cozy_kitten.id )
    visit "/shelters/#{cozy_kitten.id}/pets"
    expect(page).to have_content("Favorite Indicator")
  end
end
