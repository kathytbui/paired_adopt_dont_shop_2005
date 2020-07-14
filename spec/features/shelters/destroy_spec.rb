RSpec.describe "When I Visit a Shelter Show page" do
  before :each do
    @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    @playful_pups = Shelter.create(name: "Playful Puppies Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    @cat = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
    @review_1 = Review.create(title: "Review 1", rating: 4, content: "We loved it.", picture: "image", shelter_id: @cozy_kitten.id)
    @review_2 = Review.create(title: "Review 2", rating: 4, content: "We loved it.", picture: "image", shelter_id: @playful_pups.id)
  end

  it "I can click a button to destroy a shelter then I am redirected to the shelter's index page" do
    visit "/shelters/#{@cozy_kitten.id}"
    click_on "DELETE SHELTER"
    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(@cozy_kitten.name)
  end

  it "cannot delete shelters with Pets that have pending status" do
    application = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")
    ApplicationsPet.create(applications: application, pet: @cat)
    visit("/applications/#{application.id}")
    click_on "Approve Application For #{@cat.name}"
    expect(current_path).to eq("/pets/#{@cat.id}")
    expect(page).to have_content("Pending")
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to_not have_content("DELETE SHELTER")

    visit "/shelters"
    expect(page).to_not have_content("DELETE #{@cozy_kitten.name}")
  end

  it "should be able to delete a shelters as long as all pets do not have approved applications on them" do
    application = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")
    ApplicationsPet.create(applications: application, pet: @cat)
    visit("/applications/#{application.id}")
    expect(page).to have_content(application.name)
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to have_content("DELETE SHELTER")
    visit "/pets"
    expect(page).to_not have_content("#{@cat.name}")

    visit "/shelters"
    expect(page).to have_content("DELETE #{@cozy_kitten.name}")
    visit "/pets"
    expect(page).to_not have_content("#{@cat.name}")
  end

  it "should delete all reviews when deleting a shelter from shelter show page" do
    visit "/shelters/#{@cozy_kitten.id}"
    click_on "DELETE SHELTER"
    expect(page).to_not have_content("#{@cozy_kitten.name}")
    click_on "ALL REVIEWS"
    expect(page).to_not have_content("#{@review_1.title}")
    expect(page).to have_content("#{@review_2.title}")
  end

  it "should delete all reviews when deleting a shelter from shelters index" do
    visit "/shelters"
    click_on "DELETE #{@cozy_kitten.name}"
    expect(page).to_not have_content("#{@cozy_kitten.name}")
    click_on "ALL REVIEWS"
    expect(page).to_not have_content("#{@review_1.title}")
    expect(page).to have_content("#{@review_2.title}")
  end
end
