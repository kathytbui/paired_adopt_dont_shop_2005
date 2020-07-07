describe Shelter, type: :model do

  describe "validations" do
    describe 'relationships' do
      it { should have_many :pets }
      it { should have_many :reviews }
    end
  end
end
