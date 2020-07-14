RSpec.describe "Shelter edit" do
  before :each do
    @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
  end

  it "When I visit a shelter show page I can edit info" do
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to_not have_content("The Cutest Kitten Animal Shelter")
    click_on "UPDATE SHELTER"
    expect(current_path).to eq("/shelters/#{@cozy_kitten.id}/edit")
    fill_in :name, with: "The Cutest Kitten Animal Shelter"
    fill_in :address, with: "46 Penny Lane"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with:98738
    click_on "Update Shelter Information"
    expect(current_path).to eq("/shelters/#{@cozy_kitten.id}")
    expect(page).to have_content("THE CUTEST KITTEN ANIMAL SHELTER")
  end

  it "Has a link to pets index page" do
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to_not have_content("The Cutest Kitten Animal Shelter")
    click_on "UPDATE SHELTER"
    expect(page).to have_link("ALL PETS")
  end

  it "Has a link to shelter index page" do
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to_not have_content("The Cutest Kitten Animal Shelter")
    click_on "UPDATE SHELTER"
    expect(page).to have_link("ALL SHELTERS")
  end

  it "Has a favorite indicator in the nav" do
    visit "/shelters/#{@cozy_kitten.id}/edit"
    expect(page).to have_content("Favorite Indicator")
  end

  it "it displays a flash message indicating which fields are missing information" do
    visit "/shelters/#{@cozy_kitten.id}"
    expect(page).to_not have_content("The Cutest Kitten Animal Shelter")
    click_on "UPDATE SHELTER"
    expect(current_path).to eq("/shelters/#{@cozy_kitten.id}/edit")
    fill_in :name, with: ""
    fill_in :address, with: "46 Penny Lane"
    fill_in :city, with: ""
    fill_in :state, with: "CO"
    fill_in :zip, with:98738
    click_on "Update Shelter Information"
    expect(current_path).to eq("/shelters/#{@cozy_kitten.id}/edit")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("City can't be blank")
  end
end
