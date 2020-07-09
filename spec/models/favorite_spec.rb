describe Favorite, type: :model do
  describe 'relationships' do
    it { should belong_to :pet }
  end
end
