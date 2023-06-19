require 'support/context/omdb_search_data'

RSpec.describe MovieCommands::UpdateMovie do
  include_context 'omdb_search_data'

  let(:command) { described_class }
  let(:imdb_id) { 'tt23232' }

  before do
    allow(Omdb::InfoService).to receive(:call).and_return(omdb_object)
  end

  context 'title not set' do
    let(:movie) { create(:movie, imdb_id:, title: nil) }

    it 'returns true if updated' do
      response = command.call(movie)
      expect(response).to be(true)
    end

    it 'updates fields' do
      command.call(movie)
      movie.reload
      expect(movie.title).to eq(movie_title)
    end
  end

  context 'title set' do
    let(:movie) { create(:movie, imdb_id:) }

    it 'returns falsey' do
      response = command.call(movie)
      expect(response).to be_falsey
    end
  end
end
