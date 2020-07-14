RSpec.describe "Shelters show page" do
  before :each do
    @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    @cat = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
    @review_1 = Review.create(title: "Review 1", rating: 4, content: "We loved it.", picture: "image", shelter_id: @cozy_kitten.id)
    @review_2 = Review.create(title: "Review 2", rating: 2, content: "We loved it.", picture: "image", shelter_id: @cozy_kitten.id)
    @application = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")
    ApplicationsPet.create(applications: @application, pet: @cat)
  end

  it "shows all name, address, city, state, zip for a specific shelter" do
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to have_content(@cozy_kitten.name.upcase)
    expect(page).to have_content("#{@cozy_kitten.address}")
    expect(page).to have_content("#{@cozy_kitten.city}")
    expect(page).to have_content("#{@cozy_kitten.state}")
    expect(page).to have_content("#{@cozy_kitten.zip}")
  end

  it "has a link to take me to the shelter's pets page" do
    visit "/shelters/#{@cozy_kitten.id}"
    click_link "#{@cozy_kitten.name.upcase}'S PET INDEX"
    expect(current_path).to eq("/shelters/#{@cozy_kitten.id}/pets")
  end

  it "Has a link to pets index page" do
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to have_link("ALL PETS")
  end

  it "Has a link to shelters index page" do
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to have_link("ALL SHELTERS")
  end

  it "has a link to create a new review" do
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to have_link("CREATE NEW REVIEW")
  end

  it "Has a favorite indicator in the nav" do
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to have_content("Favorite Indicator")
  end

  it "displays shelters statistics" do
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to have_content("Number of pets at this shelter: 1")
    expect(page).to have_content("Average shelter review rating: 3")
    expect(page).to have_content("Number of applications on file for shelter: 1")
  end
end
