RSpec.describe "Edit review" do
  it "When I visit a shelter show page I click a link to edit a review" do
      cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
      review_1 = cozy_kitten.reviews.create(title: "Review 1", rating: 4, content: "It was wonderful!", picture: "image")

      visit "/shelters/#{cozy_kitten.id}"
      click_link "EDIT REVIEW", exact: true
      expect(current_path).to eq("/shelters/#{review_1.shelter_id}/reviews/#{review_1.id}/edit")

      fill_in :title, with: "Review 2"

      click_on "SUBMIT"
      expect(current_path).to eq("/shelters/#{cozy_kitten.id}")

      within("#review-#{review_1.id}") do

      expect(page).to have_content("Review 2")
      expect(page).to_not have_content("Review 1")
      end
    end
  end
