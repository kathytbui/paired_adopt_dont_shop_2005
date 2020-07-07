RSpec.describe "When I Visit a Shelter Show page" do
  it "I can click a button to destroy a shelter then I am redirected to the shelter's index page" do
    cozy_kitten1 = Shelter.create(name: "The Cozy Kitten Animal Shelter")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten1.id)
    visit "/shelters/#{cozy_kitten1.id}"
    click_on "DELETE SHELTER"
    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(cozy_kitten1.name)
  end
end
