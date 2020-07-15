describe Shelter, type: :model do
  describe 'relationships' do
    it { should have_many :pets }
    it { should have_many :reviews}
  end

  describe 'validations' do
    it { validate_presence_of :name }
    it { validate_presence_of :address }
    it { validate_presence_of :city }
    it { validate_presence_of :state }
    it { validate_presence_of :zip }
  end

	describe 'methods' do
		before :each do
      @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip: "12345")
      @cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Pending", shelter_id: @cozy_kitten.id)
      @cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
      @cat3 = Pet.create(name: 'Jinx', approx_age: 5, sex: "Female", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Jinx is a very friendly cat!", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
      @application1 = Applications.create(name: "Kathy", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I have a big backyard to play in.")
      @application2 = Applications.create(name: "Neeru", address: "123 Pleasant Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I like animals.")
      @application3 = Applications.create(name: "Judith", address: "123 Pleasant Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I like animals.")
      @application2 = Applications.create(name: "Neeru", address: "123 Pleasant Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I like animals.")
      @application3 = Applications.create(name: "Judith", address: "123 Pleasant Rd", city: "Denver", state: "CO", zip: "80207", phone_number: "123-456-6789", description: "I like animals.")
      ApplicationsPet.create(applications: @application1, pet: @cat1)
      ApplicationsPet.create(applications: @application2, pet: @cat1)
      ApplicationsPet.create(applications: @application3, pet: @cat1)
      ApplicationsPet.create(applications: @application1, pet: @cat2)
      ApplicationsPet.create(applications: @application1, pet: @cat3)
    end

    it "#application_count" do
      expect(@cozy_kitten.applications_count).to eq(5)
    end

    it "#has_pending_pets" do
      expect(@cozy_kitten.has_pending_pets).to eq(true)
    end
  end
end
