RSpec.describe MovieCommands::AddToGroup do
  let(:command) { described_class }
  let(:group) { create(:group, :with_user) }
  let(:imdb_id) { 'tt23232' }

  context 'when no movie with imdb_id' do
    it 'returns Movie' do
      response = command.call(imdb_id, group)
      expect(response).to be_a(Movie)
    end

    it 'creates a new Movie' do
      expect do
        command.call(imdb_id, group)
      end.to change(Movie, :count).by(1)
    end
  end

  context 'when movie with imdb_id exists' do
    let!(:movie) { create(:movie, imdb_id:) }

    it 'returns movie' do
      response = command.call(imdb_id, group)
      expect(response).to eq(movie)
    end

    it 'does not create a new Movie' do
      expect do
        command.call(imdb_id, group)
      end.not_to change(Movie, :count)
    end
  end
end
