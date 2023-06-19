require 'support/context/omdb_search_data'

RSpec.describe 'movies/_search_movie' do
  include_context 'omdb_search_data'

  context 'when movie in active group' do
    before do
      assign(:movie_imdb_ids, [movie_imdb_id])
      render partial: 'movies/search_movie', locals: { search_movie: omdb_object }
    end

    it 'displays Title' do
      expect(rendered).to match(/Title.*#{omdb_object.Title}/m)
    end

    it 'displays Year' do
      expect(rendered).to match(/Year.*#{omdb_object.Year}/m)
    end

    it 'displays Type' do
      expect(rendered).to match(/Type.*#{omdb_object.Type}/m)
    end

    it 'displays svg mark' do
      expect(rendered).to match(/svg.*viewBox="0 0 48 48"/)
    end
  end

  context 'when movie not in active group' do
    before do
      assign(:movie_imdb_ids, [])
      render partial: 'movies/search_movie', locals: { search_movie: omdb_object }
    end

    it 'does not display svg mark' do
      expect(rendered).not_to match(/svg/)
    end
  end
end
