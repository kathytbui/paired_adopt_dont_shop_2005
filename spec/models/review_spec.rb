RSpec.describe Review, type: :model do
	describe "validations" do
		it { should validate_presence_of :title }
		it { should validate_presence_of :rating }
		it { should validate_presence_of :content }
	end

	describe "relationships" do
		it { should belong_to :shelter }
	end

	describe "methods" do
		before :each do
			@cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Main Rd", city: "Denver", state: "CO", zip: "80207")
			@review_1 = Review.create(title: "Review 1", rating: 4, content: "We loved it.", picture: "image", shelter_id: @cozy_kitten.id)
			@review_2 = Review.create(title: "Review 2", rating: 2, content: "We loved it.", picture: "image", shelter_id: @cozy_kitten.id)
		end

		it "#average_rating" do
			expect(@cozy_kitten.reviews.average_rating).to eq(3)
		end
	end
end
