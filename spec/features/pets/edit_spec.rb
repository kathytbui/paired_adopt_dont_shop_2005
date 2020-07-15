RSpec.describe "Pet edit" do
  before :each do
    @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    @cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
  end

  it "when I visit a Pet show page I can edit the pet's info" do
    visit "/pets/#{@cat1.id}"
    click_link "EDIT #{@cat1.name.upcase}"
    expect(current_path).to eq("/pets/#{@cat1.id}/edit")
    fill_in :image, with: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg"
    fill_in :name, with: "Felicia"
    fill_in :description, with: "the coolest cat"
    fill_in :approx_age, with: 5
    fill_in :sex, with: "Female"
    click_button "Update Pet Information"
    expect(current_path).to eq("/pets/#{@cat1.id}")
    expect(page).to have_content("Felicia")
  end

  it "Has a link to shelter index page" do
    visit "/pets/#{@cat1.id}"
    click_link "EDIT #{@cat1.name.upcase}"
    expect(page).to have_link("ALL SHELTERS")
    expect(page).to have_link(nil, href: '/shelters')
  end

  it "Has a link to pet index page" do
    visit "/pets/#{@cat1.id}"
    click_link "EDIT #{@cat1.name.upcase}"
    expect(page).to have_link("ALL PETS")
  end

  it "Has a favorite indicator in the nav" do
    visit "/pets/#{@cat1.id}/edit"
    expect(page).to have_content("Favorite Indicator")
  end
end
