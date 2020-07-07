require "rails_helper"

RSpec.describe "Create a new review page" do
  it "can create a new review" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    title = "Review 1"
    rating = 4
    content = "It was wonder!"
    picture = "image"
    visit "/shelters/#{cozy_kitten.id}"
    click_on "NEW REVIEW"
    expect(current_path).to eq("/shelters/#{cozy_kitten.id}/reviews/new")
    fill_in :title, with: title
    fill_in :rating, with: rating
    fill_in :content, with: content
    fill_in :picture, with: picture
    click_on "SUBMIT"
    expect(current_path).to eq("/shelters/#{cozy_kitten.id}")
    expect(page).to have_content(title)
    expect(page).to have_content(rating)
    expect(page).to have_content(content)
    expect(page).to have_content(picture)
  end

  it "can give a flash message if title, rating, and/or content isn't filled out in the form" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    title = "Review 1"
    rating = 4
    content = "It was wonder!"
    picture = "image"

    visit "/shelters/#{cozy_kitten.id}"

    click_on "NEW REVIEW"
    expect(current_path).to eq("/shelters/#{cozy_kitten.id}/reviews/new")
    click_on "SUBMIT"

    expect(page).to have_content("Error, you are missing information, Please fill out form completely")

    expect(current_path).to eq("/shelters/#{cozy_kitten.id}/reviews/new")
  end
end
