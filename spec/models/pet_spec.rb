RSpec.describe Pet, type: :model do
	describe "relationships" do
    it { should have_many :favorites }
		it {should have_many :applications_pets}
		it {should have_many(:applications).through(:applications_pets)}
  end

	describe "methods" do
		it "#update_status" do
		cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
		cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)

		expect(cat1.update_status(cat1.id)).to eq(true)
		end
	end
end
