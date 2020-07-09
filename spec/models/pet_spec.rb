RSpec.describe Pet, type: :model do
	describe "relationships" do
    it { should have_many :favorite }
  end
end
