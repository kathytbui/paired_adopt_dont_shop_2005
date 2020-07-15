RSpec.describe "When I Visit a Pet Show page" do
  before :each do
    @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
    @cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
  end
  
  it "I can click a button to destroy a pet then I am redirected to the pet's index page where I do not see this pet" do
    visit "/pets/#{@cat1.id}"
    click_on "DELETE #{@cat1.name.upcase}"
    expect(current_path).to eq("/pets")
    expect(page).to_not have_content(@cat1.name)
  end
end
