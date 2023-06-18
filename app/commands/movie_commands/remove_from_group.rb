module MovieCommands
  class RemoveFromGroup
    attr_reader :imdb_id, :group

    def self.call(imdb_id, group)
      new(imdb_id, group).call
    end

    def initialize(imdb_id, group)
      @imdb_id = imdb_id
      @group = group
    end

    def call
      return unless imdb_id.present?

      group.movies.destroy(movie)
      movie
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound
      false
    end

    private

    def movie
      @movie ||= group.movies.find_by!(imdb_id: imdb_id)
    end
  end
end
