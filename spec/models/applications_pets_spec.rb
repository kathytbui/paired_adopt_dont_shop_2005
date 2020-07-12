RSpec.describe ApplicationsPets, type: :model do
	describe "relationships" do
    it { should belong_to :applications}
    it { should belong_to :pet}
  end
end
