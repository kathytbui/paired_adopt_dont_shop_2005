RSpec.describe "Shelters show page" do
  # before :each do
  #   cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
  #   review_1 = cozy_kitten.reviews.create(title: "Review 1", rating: 4, content: "It was wonderful!", picture: "image")
  # end
  it "shows all name, address, city, state, zip for a specific shelter" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    review_1 = cozy_kitten.reviews.create(title: "Review 1", rating: 4, content: "It was wonderful!", picture: "image")
    visit "/shelters/#{cozy_kitten.id}"
    expect(page).to have_content(cozy_kitten.name.upcase)
    expect(page).to have_content("#{cozy_kitten.address}")
    expect(page).to have_content("#{cozy_kitten.city}")
    expect(page).to have_content("#{cozy_kitten.state}")
    expect(page).to have_content("#{cozy_kitten.zip}")
  end

  it "has a link to take me to the shelter's pets page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    review_1 = cozy_kitten.reviews.create(title: "Review 1", rating: 4, content: "It was wonderful!", picture: "image")
    visit "/shelters/#{cozy_kitten.id}"
    click_link "#{cozy_kitten.name.upcase}'S PET INDEX"
    expect(current_path).to eq("/shelters/#{cozy_kitten.id}/pets")
  end

  it "Has a link to pets index page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    review_1 = cozy_kitten.reviews.create(title: "Review 1", rating: 4, content: "It was wonderful!", picture: "image")
    visit "/shelters/#{cozy_kitten.id}"
    expect(page).to have_link("ALL PETS")
  end

  it "Has a link to shelters index page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    review_1 = cozy_kitten.reviews.create(title: "Review 1", rating: 4, content: "It was wonderful!", picture: "image")
    visit "/shelters/#{cozy_kitten.id}"
    expect(page).to have_link("ALL SHELTERS")
  end

  it "Has a list of reviews for the shelter" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    review_1 = cozy_kitten.reviews.create(title: "Review 1", rating: 4, content: "It was wonderful!", picture: "image")
    visit "/shelters/#{cozy_kitten.id}"
    expect(page).to have_content(review_1.title)
    expect(page).to have_content(review_1.rating)
    expect(page).to have_content(review_1.content)
    expect(page).to have_content(review_1.picture)
  end

  it "has a link to create a new review" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    visit "/shelters/#{cozy_kitten.id}"
    expect(page).to have_link("NEW REVIEW")
  end
end
