describe Shelter, type: :model do

  describe "validations" do
    describe 'relationships' do
      it { should have_many :pets }
    end
  end
end
