module MovieCommands
  class UpdateMovie
    attr_reader :movie

    def self.call(movie)
      new(movie).call
    end

    def initialize(movie)
      @movie = movie
    end

    def call
      return if movie.title.present?

      info = movie_info(movie.imdb_id)
      movie.update(movie_body(info)) if info
    end

    private

    def movie_body(info)
      {
        title: info.Title,
        year: info.Year,
        poster: info.Poster,
        plot: info.Plot,
        movie_type: info.Type
      }
    end

    def movie_info(imdb_id)
      Omdb::InfoService.call(imdb_id)
    end
  end
end
