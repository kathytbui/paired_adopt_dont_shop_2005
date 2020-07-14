RSpec.describe 'Application show page' do
  before(:each) do
    @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    @cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
    @cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
    @cat3 = Pet.create(name: 'Jinx', approx_age: 5, sex: "Female", image: "", description: "Jinx is a very friendly cat!", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)

    @favorite1 = Favorite.create(pet_id: @cat1.id)

    @application1 = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")

    @application2 = Applications.create(name: "Neeru", address: "123 Pleasant Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I like animals.")
    @application3 = Applications.create(name: "Judith", address: "123 Pleasant Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I like animals.")
    ApplicationsPet.create(applications: @application1, pet: @cat1)
    ApplicationsPet.create(applications: @application2, pet: @cat1)
    ApplicationsPet.create(applications: @application3, pet: @cat1)
    ApplicationsPet.create(applications: @application1, pet: @cat2)
    ApplicationsPet.create(applications: @application1, pet: @cat3)
  end

  it "I see all the information from the application and names of all pets which should link to their show pages" do
    visit("/applications/#{@application1.id}")
    expect(page).to have_content(@application1.name)
    expect(page).to have_content(@application1.address)
    expect(page).to have_content(@application1.city)
    expect(page).to have_content(@application1.state)
    expect(page).to have_content(@application1.zip)
    expect(page).to have_content(@application1.phone_number)
    expect(page).to have_content(@application1.description)

    expect(page).to have_link(@cat1.name)

    click_on "Fred"

    expect(current_path).to eq("/pets/#{@cat1.id}")
  end

  it "I see a link to approve the application for a specific pet" do
    visit("/applications/#{@application1.id}")

    click_on "Approve Application For #{@cat1.name}"

    expect(current_path).to eq("/pets/#{@cat1.id}")

    expect(page).to have_content("Pending")
    expect(page).to have_content("On hold for #{@application1.name}")

    visit "/pets/#{@cat2.id}"
    expect(page).to_not have_content("Pending")
  end

  it "I'm able to approve the application for any number of pets" do
    visit("/applications/#{@application1.id}")
    expect(page).to have_link("Approve Application For #{@cat2.name}")
    expect(page).to have_link("Approve Application For #{@cat3.name}")
  end

  it "I can not approve any other applications for that pet if one has been approved already" do
    visit("/applications/#{@application1.id}")
    click_on "Approve Application For #{@cat1.name}"

    visit "/pets/#{@cat1.id}/applications"
    expect(page).to have_content(@application2.name)
    click_on "#{@application2.name}"
    expect(page).to_not have_link("Approve Application For #{@cat1.name}")
  end

  it "I can revoke an application for a pet" do
    visit("/applications/#{@application1.id}")
    click_on "Approve Application For #{@cat1.name}"

    visit("/applications/#{@application1.id}")
    expect(page).to_not have_link("Approve Application For #{@cat1.name}")
    expect(page).to have_link("Unapprove Application For #{@cat1.name}")
    click_on "Unapprove Application For #{@cat1.name}"

    expect(current_path).to eq("/applications/#{@application1.id}")
    expect(page).to have_link("Approve Application For #{@cat1.name}")

    visit("/pets/#{@cat1.id}")
    expect(page).to_not have_content("Pending")
    expect(page).to have_content("Adoptable")
    expect(page).to_not have_content("On hold for #{@application1.name}")
  end
end
