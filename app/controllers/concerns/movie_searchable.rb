module MovieSearchable
  extend ActiveSupport::Concern

  private

  def prepare_movie_searchable_variables
    @term = params[:search]
    @search_movie = @term ? search_movie(@term) : nil
    @movie_imdb_ids = current_user.active_group.movies.pluck(:imdb_id)
  end

  def search_movie(term)
    Rails.cache.fetch("search_movie/#{term}", expires_in: 5.minutes) do
      Omdb::SearchService.call(term)
    end
  end
end
