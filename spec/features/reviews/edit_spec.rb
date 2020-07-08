RSpec.describe "Edit a review" do
  describe "when I visit a shelter's show page I see a link to edit the shelter review next to the review"
  it "I click on the link and I am taken to a edit shelter review path" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    review_2 = Review.create(title: "Review 3", rating: 4, content: "We loved it.", picture: "image", shelter_id: cozy_kitten.id)

    visit "/shelters/#{cozy_kitten.id}"

    click_on "EDIT REVIEW"

    expect(current_path).to eq("/reviews/#{review_2.id}/edit")

    title = "Review 5"

    fill_in :title, with: "Review 5"
    fill_in :rating, with: 3
    fill_in :content, with: "We hated it."
    fill_in :picture, with: "image1"

    click_on "SUBMIT EDITS"

    expect(current_path).to eq("/shelters/#{review_2.shelter_id}")
    expect(page).to have_content(title)
    expect(page).to_not have_content("Review 3")
  end

  it "can see a flash message indicating that user needs to fill in a title, rating, and content in order to edit a shelter review" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    review_2 = Review.create(title: "Review 3", rating: 4, content: "We loved it.", picture: "image", shelter_id: cozy_kitten.id)

    visit "/reviews/#{review_2.id}/edit"

    fill_in :title, with: ""
    fill_in :rating, with: ""
    fill_in :content, with: ""
    fill_in :picture, with: ""

    click_on "SUBMIT EDITS"

    expect(page).to have_content("Error, you are missing information, Please fill out form completely")
    expect(current_path).to eq("/reviews/#{review_2.id}/edit")
  end

end
