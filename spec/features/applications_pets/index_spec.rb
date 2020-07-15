RSpec.describe "Pet applications index page" do

  before(:each) do
    @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    @cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
    @cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)

    @favorite1 = Favorite.create(pet_id: @cat1.id)

    @application1 = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")

    ApplicationsPet.create(applications: @application1, pet: @cat1)
  end

  it "has a flash message for a pet that has no applications" do
    visit "/pets/#{@cat2.id}/applications"
    expect(page).to have_content("No applications exist for this pet")
  end

  it "doesn't have a flash message that says it has no applications" do
    visit "/pets/#{@cat1.id}/applications"
    expect(page).to_not have_content("No applications exist for this pet")
  end

  it "All Applicant Names are links to that Applicant's application" do
    visit "/pets/#{@cat1.id}/applications"
    expect(page).to have_link("#{@application1.name}")
  end
end
