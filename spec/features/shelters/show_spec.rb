RSpec.describe "Shelters show page" do
  it "shows all name, address, city, state, zip for a specific shelter" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    visit "/shelters/#{cozy_kitten.id}"
    expect(page).to have_content(cozy_kitten.name.upcase)
    expect(page).to have_content("#{cozy_kitten.address}")
    expect(page).to have_content("#{cozy_kitten.city}")
    expect(page).to have_content("#{cozy_kitten.state}")
    expect(page).to have_content("#{cozy_kitten.zip}")
  end

  it "has a link to take me to the shelter's pets page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    visit "/shelters/#{cozy_kitten.id}"
    click_link "#{cozy_kitten.name.upcase}'S PET INDEX"
    expect(current_path).to eq("/shelters/#{cozy_kitten.id}/pets")
  end

  it "Has a link to pets index page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    visit "/shelters/#{cozy_kitten.id}"
    expect(page).to have_link("ALL PETS")
  end

  it "Has a link to shelters index page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    visit "/shelters/#{cozy_kitten.id}"
    expect(page).to have_link("ALL SHELTERS")
  end
end
