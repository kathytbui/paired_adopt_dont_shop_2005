RSpec.describe "Delete a Review" do
  it "can delete a review and return to the shelter's show page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    review_2 = Review.create(title: "Review 3", rating: 4, content: "We loved it.", picture: "image", shelter_id: cozy_kitten.id)

    visit "/shelters/#{cozy_kitten.id}"
    expect(page).to have_content(review_2.title)

    click_on "DELETE REVIEW"

    expect(current_path).to eq("/shelters/#{cozy_kitten.id}")
    expect(page).to_not have_content(review_2.title)
  end

end
