RSpec.describe Pet, type: :model do
	describe "relationships" do
		it { should have_many :favorites }
		it {should have_many :applications_pets}
		it {should have_many(:applications).through(:applications_pets)}
	end

	describe "validations" do
		it { should validate_presence_of :name }
		it { should validate_presence_of :approx_age }
		it { should validate_presence_of :sex }
		it { should validate_presence_of :description }
		it { should validate_presence_of :image }
	end

	describe "methods" do
		before :each do
			@cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
			@cat = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
			@application1 = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")
      ApplicationsPet.create(applications: @application1, pet: @cat, status: "Pending")
		end

		it "#update_status" do
			expect(@cat.update_status).to eq(true)
		end

		it "#pets_count" do
			expect(@cozy_kitten.pets.pets_count).to eq(1)
		end

		it "#applicant_name" do
			expect(@cat.applicant_name).to eq(@application1.name)
		end

		it "#applicant_id" do
			expect(@cat.applicant_id).to eq(@application1.id)
		end

		it "#has_pending_applications" do
			expect(@cat.has_pending_applications).to eq(true)
		end
	end
end
