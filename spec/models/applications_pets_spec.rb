RSpec.describe ApplicationsPet, type: :model do
	describe "relationships" do
    it { should belong_to :applications}
    it { should belong_to :pet}
		it { should have_many :approvals}
  end

	describe "methods" do
		it "#uniq_app" do
			@cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
	    @cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
	    @cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
	    @application1 = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")
	    app_pet1 = ApplicationsPet.create(applications: @application1, pet: @cat1)
			app_pet2 = ApplicationsPet.create(applications: @application1, pet: @cat2)

      expect(ApplicationsPet.uniq_app(@application1.id, @cat1.id)).to eq(app_pet1)
    end

	end
end
