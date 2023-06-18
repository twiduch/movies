RSpec.describe MovieCommands::RemoveFromGroup do
  let(:command) { described_class }
  let(:group) { create(:group, :with_user) }
  let(:imdb_id) { 'tt23232' }

  context 'when no movie with imdb_id' do
    it 'returns Movie' do
      response = command.call(imdb_id, group)
      expect(response).to be(false)
    end
  end

  context 'when movie with imdb_id exists' do
    let(:other_id) { 'other_id' }
    let(:movie) { create(:movie, imdb_id:) }
    let!(:movie2) { create(:movie, imdb_id: other_id) }

    before do
      group.movies << movie
    end

    it 'returns movie' do
      response = command.call(imdb_id, group)
      expect(response).to eq(movie)
    end

    it 'does not destroy movie' do
      expect do
        command.call(imdb_id, group)
      end.not_to change(Movie, :count)
    end

    it 'returns false if wrong imdb_id' do
      response = command.call('wrong', group)
      expect(response).to be(false)
    end

    it 'returns false if movie not in group' do
      response = command.call(other_id, group)
      expect(response).to be(false)
    end
  end
end
