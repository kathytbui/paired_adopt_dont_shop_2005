describe Shelter, type: :model do
  describe 'relationships' do
    it { should have_many :pets }
    it { should have_many :reviews}
  end

  describe 'validations' do
    it { validate_presence_of :name }
    it { validate_presence_of :address }
    it { validate_presence_of :city }
    it { validate_presence_of :state }
    it { validate_presence_of :zip }
  end
end
