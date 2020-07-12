RSpec.describe ApplicationsPet, type: :model do
	describe "relationships" do
    it { should belong_to :applications}
    it { should belong_to :pet}
		it { should have_many :approvals}
  end

	describe "methods" do
		
	end
end
