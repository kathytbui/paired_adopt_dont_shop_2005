RSpec.describe "Delete a Review" do
  before :each do
    @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    @review = Review.create(title: "Review 3", rating: 4, content: "We loved it.", picture: "image", shelter_id: @cozy_kitten.id)
  end
  
  it "can delete a review and return to the shelter's show page" do
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to have_content(@review.title)

    click_on "DELETE REVIEW"

    expect(current_path).to eq("/shelters/#{@cozy_kitten.id}")
    expect(page).to_not have_content(@review.title)
  end
end
