RSpec.describe "When I Visit a Shelter Show page" do
  before :each do
    @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", city: "Denver", state: "CO", zip: 80207)
    @cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
  end

  it "I can click a button to destroy a shelter then I am redirected to the shelter's index page" do
    visit "/shelters/#{@cozy_kitten.id}"
    click_on "DELETE SHELTER"
    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(@cozy_kitten.name)
  end

  it "cannot delete shelters with Pets that have pending status" do
    application = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")
    ApplicationsPet.create(applications: application, pet: @cat1)
    visit("/applications/#{application.id}")
    click_on "Approve Application For #{@cat1.name}"
    expect(current_path).to eq("/pets/#{@cat1.id}")
    expect(page).to have_content("Pending")
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to_not have_content("DELETE #{@cozy_kitten.name}")

    visit "/shelters"
    expect(page).to_not have_content("DELETE #{@cozy_kitten.name}")
  end
end
