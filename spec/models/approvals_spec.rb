RSpec.describe Approval, type: :model do
	describe "relationships" do
    it { should belong_to :applications_pet}
  end
end
