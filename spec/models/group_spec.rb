RSpec.describe Group do
  let(:group) { build(:group, :with_user) }

  it 'is valid with valid attributes' do
    expect(group).to be_valid
  end

  it 'has initial movies count 0' do
    expect(group.movies_count).to eq 0
  end

  context 'when adding movie' do
    let(:group) { create(:group, :with_user) }
    let(:movie) { create(:movie) }

    it 'updates movies_count' do
      expect do
        group.movies << movie
      end.to change(group, :movies_count).by(1)
    end
  end

  context 'when removing movie' do
    let(:group) { create(:group, :with_user) }
    let(:movie) { create(:movie) }

    before do
      group.movies << movie
    end

    it 'updates movies_count' do
      expect do
        group.movies.destroy(movie)
      end.to change(group, :movies_count).by(-1)
    end

    it 'does not remove movie' do
      expect do
        group.movies.destroy(movie)
      end.not_to change(Movie, :count)
    end
  end
end
