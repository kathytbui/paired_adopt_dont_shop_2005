RSpec.describe "Create a new review" do
  before :each do
    @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
  end

  it "creates a new review" do
    visit "/shelters/#{@cozy_kitten.id}"

      click_link "CREATE NEW REVIEW"

    expect(current_path).to eq("/shelters/#{@cozy_kitten.id}/reviews/new")
    title = "Review 1"

    fill_in :title, with: "Review 1"
    fill_in :rating, with: 5
    fill_in :content, with: "We really liked it."
    fill_in :picture, with: "image"

    click_on "CREATE NEW REVIEW"
    expect(current_path).to eq("/shelters/#{@cozy_kitten.id}")
    expect(page).to have_content(title)
  end

  it "can give a flash message if title, rating, and/or content isn't filled out in the form" do
   title = "Review 1"
   rating = 4
   content = "It was wonder!"
   picture = "image"

   visit "/shelters/#{@cozy_kitten.id}"

   click_on "CREATE NEW REVIEW"
   expect(current_path).to eq("/shelters/#{@cozy_kitten.id}/reviews/new")
   click_on "CREATE NEW REVIEW"

   expect(page).to have_content("Error, you are missing information, Please fill out form completely")

   expect(current_path).to eq("/shelters/#{@cozy_kitten.id}/reviews/new")
 end

 it "creates a new review without a picture" do
   visit "/shelters/#{@cozy_kitten.id}"

   click_link "CREATE NEW REVIEW"

   expect(current_path).to eq("/shelters/#{@cozy_kitten.id}/reviews/new")
   title = "Review 1"

   fill_in :title, with: "Review 1"
   fill_in :rating, with: 5
   fill_in :content, with: "We really liked it."
   fill_in :picture, with: ""

   click_on "CREATE NEW REVIEW"
   expect(current_path).to eq("/shelters/#{@cozy_kitten.id}")
   expect(page).to have_content(title)
 end

 it "Has a favorite indicator in the nav" do
   visit "/shelters/#{@cozy_kitten.id}/reviews/new"
   expect(page).to have_content("Favorite Indicator")
 end
end
