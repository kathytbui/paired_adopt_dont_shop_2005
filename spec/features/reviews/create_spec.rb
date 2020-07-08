RSpec.describe "Create a new review" do

  it "creates a new review" do
    cozy_kitten1 = Shelter.create(name: "The Cozy Kitten Animal Shelter")

    visit "/shelters/#{cozy_kitten1.id}"

    click_link "NEW REVIEW"

    expect(current_path).to eq("/shelters/#{cozy_kitten1.id}/reviews/new")
    title = "Review 1"

    fill_in :title, with: "Review 1"
    fill_in :rating, with: 5
    fill_in :content, with: "We really liked it."
    fill_in :picture, with: "image"

    click_on "CREATE NEW REVIEW"
    expect(current_path).to eq("/shelters/#{cozy_kitten1.id}")
    expect(page).to have_content(title)
  end
end
