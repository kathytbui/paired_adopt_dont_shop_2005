RSpec.describe "Review index page" do
  it "should have a list of reviews" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
    review_2 = Review.create(title: "Review 3", rating: 4, content: "We loved it.", picture: "image", shelter_id: cozy_kitten.id)

    visit '/reviews'

    expect(page).to have_content("Review 3")
    expect(page).to have_content("4")
    expect(page).to have_content("We loved it")
    expect(page).to have_content("image")
  end
end
