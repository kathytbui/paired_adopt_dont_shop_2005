describe Favorite, type: :model do
  describe "relationships" do
    it { should belong_to :pet }
  end

  describe "methods" do
    before :each do
      @cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
      @cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
      @cat2 = Pet.create(name: 'Gordo', approx_age: 5, sex: "Male", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Gordo is a very fluffy cat!", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
      @cat3 = Pet.create(name: 'Jinx', approx_age: 5, sex: "Female", image: "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-650-80.jpg", description: "Jinx is a very friendly cat!", adoption_status: "Adoptable", shelter_id: @cozy_kitten.id)
      @favorite1 = Favorite.create(pet_id: @cat1.id)
      @favorite2 = Favorite.create(pet_id: @cat2.id)
      @favorite3 = Favorite.create(pet_id: @cat3.id)
      @favorites = Favorite.all
    end

    it "#pets" do
      expect(@favorites.pets).to eq([@cat1, @cat2, @cat3])
    end
  end
end
