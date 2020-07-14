RSpec.describe Applications, type: :model do
	describe "relationships" do
    it { should have_many :applications_pets}
    it {should have_many(:pets).through(:applications_pets)}
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
	# 
	# describe "methods" do
	# 	it "#" do
	#
	# 	end
	# end
end
