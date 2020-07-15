RSpec.describe ApplicationsPet, type: :model do
	describe "relationships" do
		it { should belong_to :applications}
		it { should belong_to :pet}
	end

	describe "methods" do
		before :each do
			@cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
			@cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
			@application1 = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")
			@app_pet = ApplicationsPet.create(applications: @application1, pet: @cat1)
		end

		it "#get_applications_pet" do
			expect(ApplicationsPet.get_applications_pet(@application1.id, @cat1.id)).to eq(@app_pet)
		end
	end
end
