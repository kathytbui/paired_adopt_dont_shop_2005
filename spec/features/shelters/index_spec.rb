RSpec.describe 'Shelter Index page' do
  before :each do
    @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    @playful_pups = Shelter.create(name: "Playful Puppies Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
  end

  # it 'When I visit /shelters I see the names of all shelters' do
  #   visit '/shelters'
  #   expect(page).to have_content(@cozy_kitten.name.upcase)
  #   expect(page).to have_content(@playful_pups.name.upcase)
  # end


  it "When I click the edit link I'm taken to a page to edit shelter's info" do
    visit '/shelters'
    within(".shelters-#{@cozy_kitten.id}") do
      click_link "EDIT SHELTER"
    end
    expect(current_path).to eq("/shelters/#{@cozy_kitten.id}/edit")
  end

#   it "When I click the delete link the shelter is deleted and I no longer see the page on the shelter index page" do
#     visit '/shelters'
#     click_link "DELETE #{@cozy_kitten.name}"
#     expect(current_path).to eq("/shelters")
#     expect(page).to_not have_content("Cozy Kitten Animal Shelter")
#   end
#
#   it "Has a link to pets index page" do
#     visit '/shelters'
#     expect(page).to have_link("ALL PETS")
#   end
#
#   it "Each shelter's name links to their show page" do
#     visit '/shelters'
#     expect(page).to have_link("#{@cozy_kitten.name.upcase}")
#     expect(page).to have_link("#{@playful_pups.name.upcase}")
#   end
#
#   it "Has a favorite indicator in the nav" do
#     visit "/shelters"
#     expect(page).to have_content("Favorite Indicator")
#   end
#
#   it "I can click a link to get to the favorites page" do
#     visit "/shelters"
#     click_on "Favorite Indicator:"
#     expect(current_path).to eq("/favorites")
#   end
end
