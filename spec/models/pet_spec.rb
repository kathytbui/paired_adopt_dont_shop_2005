RSpec.describe Pet, type: :model do
	describe "relationships" do
    it { should have_many :favorites }
		it {should have_many :applications_pets}
		it {should have_many(:applications).through(:applications_pets)}
  end
end
