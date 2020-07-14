RSpec.describe Pet, type: :model do
	describe "relationships" do
    it { should have_many :favorites }
		it {should have_many :applications_pets}
		it {should have_many(:applications).through(:applications_pets)}
  end

	describe "methods" do
		before :each do
			@cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
			@cat = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
		end

		it "#update_status" do
			expect(@cat.update_status(@cat.id)).to eq(true)
		end

		it "#pets_count" do
			expect(@cozy_kitten.pets.pets_count).to eq(1)
		end
	end
end
