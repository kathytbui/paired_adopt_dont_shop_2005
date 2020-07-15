RSpec.describe "Create a new review" do

  it "creates a new review" do
    cozy_kitten1 = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")

    visit "/shelters/#{cozy_kitten1.id}"

      click_link "CREATE NEW REVIEW"

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

  it "can give a flash message if title, rating, and/or content isn't filled out in the form" do
   cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
   title = "Review 1"
   rating = 4
   content = "It was wonder!"
   picture = "image"

   visit "/shelters/#{cozy_kitten.id}"

   click_on "CREATE NEW REVIEW"
   expect(current_path).to eq("/shelters/#{cozy_kitten.id}/reviews/new")
   click_on "CREATE NEW REVIEW"

   expect(page).to have_content("Error, you are missing information, Please fill out form completely")

   expect(current_path).to eq("/shelters/#{cozy_kitten.id}/reviews/new")
 end

 it "creates a new review without a picture" do
   cozy_kitten1 = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")

   visit "/shelters/#{cozy_kitten1.id}"

   click_link "CREATE NEW REVIEW"

   expect(current_path).to eq("/shelters/#{cozy_kitten1.id}/reviews/new")
   title = "Review 1"

   fill_in :title, with: "Review 1"
   fill_in :rating, with: 5
   fill_in :content, with: "We really liked it."
   fill_in :picture, with: ""

   click_on "CREATE NEW REVIEW"
   expect(current_path).to eq("/shelters/#{cozy_kitten1.id}")
   expect(page).to have_content(title)
 end

 it "Has a favorite indicator in the nav" do
   cozy_kitten1 = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
   visit "/shelters/#{cozy_kitten1.id}/reviews/new"
   expect(page).to have_content("Favorite Indicator")
 end
end
