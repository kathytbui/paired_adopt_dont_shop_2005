RSpec.describe Pet, type: :model do
	describe "relationships" do
    it { should have_many :favorite }
		it { should have_many :applicant_pets }
		it { should have_many(:applicants).through(:applicant_pets) }
  end
end
