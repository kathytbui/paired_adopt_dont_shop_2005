RSpec.describe "Pets show page" do
  it "shows all image, name, description, approx age, sex, adoption status for a specific pet" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id )
    visit "/pets/#{cat1.id}"
    expect(page).to have_content("FRED")
    expect(page).to have_content("#{cat1.approx_age}")
    expect(page).to have_content("#{cat1.sex}")
    expect(page).to have_css("img[src=\"#{cat1.image}\"]")
    expect(page).to have_content("#{cat1.description}")
    expect(page).to have_content("#{cat1.adoption_status}")
  end

  it "Has a link to pets index page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id )
    visit "/pets/#{cat1.id}"
    expect(page).to have_link("ALL PETS")
  end

  it "Has a link to shelter index page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id )
    visit "/pets/#{cat1.id}"
    expect(page).to have_link("ALL SHELTERS")
  end

  it "Has a favorite indicator in the nav" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id )
    visit "/pets/#{cat1.id}"
    expect(page).to have_content("Favorite Indicator")
  end

  it "has a link to applications for this pet" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    cat2 = Pet.create(name: 'Gordo', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Gorod is the cutest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    favorite1 = Favorite.create(pet_id: cat1.id)
    favorite2 = Favorite.create(pet_id: cat2.id)
    application1 = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")
    application2 = Applications.create(name: "Neeru", address: "123 Pleasant Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I like animals.")
    application3 = Applications.create(name: "Neeru", address: "123 Pleasant Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I like animals.")
    ApplicationsPet.create(applications: application1, pet: cat1)
    ApplicationsPet.create(applications: application2, pet: cat1)
    ApplicationsPet.create(applications: application2, pet: cat2)

    visit("/pets/#{cat1.id}")

    click_on "View All Applications"
    expect(current_path).to eq("/pets/#{cat1.id}/applications")

    expect(page).to have_link(application1.name)
    expect(page).to have_link(application2.name)

    click_on "Kathy"

    expect(current_path).to eq("/applications/#{application1.id}")
  end

  it "If a pet has an approved application on them I can not delete that pet" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    application1 = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")

    ApplicationsPet.create(applications: application1, pet: cat1)

    visit("/applications/#{application1.id}")

    click_on "Approve Application For #{cat1.name}"

    visit("/pets/#{cat1.id}")
    expect(page).to_not have_content("DELETE FRED")
  end
end
