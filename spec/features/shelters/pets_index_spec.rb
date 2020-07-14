RSpec.describe "Shelter Pets index page" do
  before :each do
    @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    @puppy_playground = Shelter.create(name: "The Puppy Playground", address: "125 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    @cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: @cozy_kitten.id, description: "Very cute but ferocious cat" )
    @cat2 = Pet.create(name: 'Sophie', approx_age: 6, sex: "Female", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: @cozy_kitten.id, description: "Very cute but ferocious cat")
    @dog1 = Pet.create(name: 'Milo', approx_age: 3, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", shelter_id: @puppy_playground.id, description: "Very cute but ferocious dog")
  end

  it "When I visit '/shelters/:shelter_id/pets' I see all pets that can be adopted from that shelter" do
    visit "/shelters/#{@cozy_kitten.id}/pets"
    expect(page).to have_content("FRED")
    expect(page).to have_content("#{@cat1.approx_age}")
    expect(page).to have_content("#{@cat1.sex}")
    expect(page).to have_css("img[src=\"#{@cat1.image}\"]")
    expect(page).to have_content("SOPHIE")
    expect(page).to have_content("#{@cat2.approx_age}")
    expect(page).to have_content("#{@cat2.sex}")
    expect(page).to have_css("img[src=\"#{@cat2.image}\"]")
    expect(page).to_not have_content("MILO")
    expect(page).to_not have_content("#{@dog1.approx_age}")
  end

  it "displays an edit link next to every pet that takes me to a page to edit pet's info" do
    visit "/shelters/#{@cozy_kitten.id}/pets"
    click_link "EDIT #{@cat1.name.upcase}'S INFO"
    expect(current_path).to eq("/pets/#{@cat1.id}/edit")
  end

  it "displays a link next to every pet to delete the pet and when I click it, I no longer see the pet on the pet index page" do
    visit "shelters/#{@cozy_kitten.id}/pets"
    click_link "DELETE #{@cat1.name.upcase}"
    expect(current_path).to eq("/pets")
    expect(page).to_not have_content("FRED")
  end

  it "Has a link to pets index page" do
    visit "/shelters/#{@cozy_kitten.id}/pets"
    expect(page).to have_link("ALL PETS")
  end

  it "Has a link to shelters index page" do
    visit "/shelters/#{@cozy_kitten.id}/pets"
    expect(page).to have_link("ALL SHELTERS")
  end

  it "Each pet's name links to their show page" do
    visit "/shelters/#{@cozy_kitten.id}/pets"
    expect(page).to have_link("#{@cat1.name.upcase}")
    expect(page).to have_link("#{@cat2.name.upcase}")
  end

  it "Each shelter's name links to their show page" do
    visit "/shelters/#{@cozy_kitten.id}/pets"
    expect(page).to have_link("#{@cozy_kitten.name.upcase}")
  end

  it "It shows the count of pets that belong to that shelter" do
    visit "/shelters/#{@cozy_kitten.id}/pets"
    expect(page).to have_content("NUMBER OF ADOPTABLE PETS:")
    expect(page).to have_content("2")
  end

  it "Has a favorite indicator in the nav" do
    visit "/shelters/#{@cozy_kitten.id}/pets"
    expect(page).to have_content("Favorite Indicator")
  end
end
