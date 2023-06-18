RSpec.describe MovieCommands::UpdateMovie do
  let(:command) { described_class }
  let(:imdb_id) { 'tt23232' }
  let(:movie_title) { 'Avatar: The Way of Water' }
  let(:omdb_object_data) do
    {
      Title: movie_title,
      Year: '2022',
      Plot: 'Jake Sully lives with his newfound family formed on the extrasolar moon Pandora.',
      Poster: 'https://m.media-amazon.com/images/M/MV5yMjQxNTE1MDA@._V1_SX300.jpg',
      imdbID: 'tt1630029',
      Type: 'movie'
    }
  end
  let(:omdb_object) { OpenStruct.new(omdb_object_data) }

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
