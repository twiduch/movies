RSpec.shared_context 'omdb_search_data' do
  let(:movie_title) { 'Avatar: The Way of Water' }
  let(:movie_imdbID) { 'tt1630029' }
  let(:omdb_object_data) do
    {
      Title: movie_title,
      Year: '2022',
      Plot: 'Jake Sully lives with his newfound family formed on the extrasolar moon Pandora.',
      Poster: 'https://m.media-amazon.com/images/M/MV5yMjQxNTE1MDA@._V1_SX300.jpg',
      imdbID: movie_imdbID,
      Type: 'movie'
    }
  end
  let(:omdb_object) { OpenStruct.new(omdb_object_data) }
end