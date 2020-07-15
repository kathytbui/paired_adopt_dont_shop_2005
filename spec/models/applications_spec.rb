RSpec.describe Applications, type: :model do
	describe "relationships" do
		it { should have_many :applications_pets }
		it { should have_many(:pets).through(:applications_pets) }
	end

	describe "validations" do
		it { should validate_presence_of :name }
		it { should validate_presence_of :address }
		it { should validate_presence_of :city }
		it { should validate_presence_of :state }
		it { should validate_presence_of :zip }
		it { should validate_presence_of :phone_number }
		it { should validate_presence_of :description	 }
	end

	describe "methods" do
		before :each do
			@cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
			@cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
			@application1 = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")
			@application2 = Applications.create(name: "Neeru", address: "123 Pleasant Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I like animals.")
			@application3 = Applications.create(name: "Judith", address: "123 Pleasant Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I like animals.")
			ApplicationsPet.create(applications: @application1, pet: @cat1)
			ApplicationsPet.create(applications: @application2, pet: @cat1)
			ApplicationsPet.create(applications: @application3, pet: @cat1)
		end

		it "#applications_count" do
			expect(Applications.applications_count).to eq(3)
		end
	end
end
