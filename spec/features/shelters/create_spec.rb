RSpec.describe "Create a new shelter" do
  it "when I visit the shelter index page, I can follow a link to create a new shelter" do
    visit '/shelters'
    expect(page).to_not have_content("THE FRIENDLY FISH ANIMAL SHELTER")
    click_on 'CREATE A NEW SHELTER'
    expect(current_path).to eq('/shelters/new')
    fill_in :name, with: "The Friendly Fish Animal Shelter"
    fill_in :address, with: "456 Ocean Avenue"
    fill_in :city, with: "Boston"
    fill_in :state, with: "MA"
    fill_in :zip, with:98738
    click_on 'Create Shelter'
    expect(current_path).to eq('/shelters')
    expect(page).to have_content("THE FRIENDLY FISH ANIMAL SHELTER")
  end

  it "Has a link to pets index page" do
    visit '/shelters'
    click_on 'CREATE A NEW SHELTER'
    expect(page).to have_link("ALL PETS")
  end

  it "Has a link to shelter index page" do
    visit '/shelters'
    click_on 'CREATE A NEW SHELTER'
    expect(page).to have_link("ALL SHELTERS")
  end

  it "Has a favorite indicator in the nav" do
    visit '/shelters/new'
    expect(page).to have_content("Favorite Indicator")
  end

  it "it displays a flash message indicating which fields are missing information" do
    visit '/shelters'
    expect(page).to_not have_content("THE FRIENDLY FISH ANIMAL SHELTER")
    click_on 'CREATE A NEW SHELTER'
    expect(current_path).to eq('/shelters/new')
    fill_in :address, with: "456 Ocean Avenue"
    fill_in :state, with: "MA"
    fill_in :zip, with:98738
    click_on 'Create Shelter'
    expect(current_path).to eq('/shelters/new')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("City can't be blank")
  end
end
