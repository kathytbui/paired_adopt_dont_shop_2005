RSpec.describe "Edit review" do
  it "When I visit a shelter show page I click a link to edit a review" do
      cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
      review_1 = cozy_kitten.reviews.create(title: "Review 1", rating: 4, content: "It was wonderful!", picture: "image")

      title = "Review 1"
      rating = 4
      content = "It was wonder!"
      picture = "image"

      visit "shelters/#{cozy_kitten.id}"
      click_link "EDIT REVIEW"
      expect(current_path).to eq("shelters/#{cozy_kitten.id}/reviews/#{review_1.id}/edit")

      expect(page).to have_content(title)
      expect(page).to have_content(rating)
      expect(page).to have_content(content)
      expect(page).to have_content(picture)

      fill_in :title, with: "Review 2", exact: true

      click_on "SUBMIT"
      expect(current_path).to eq("shelters/#{cozy_kitten.id}")

      expect(page).to have_content("Review 2"), exact: true
      expect(page).to_not have_content("Review 1"), exact: true
    end
  end
