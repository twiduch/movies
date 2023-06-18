module MovieCommands
  class AddToGroup
    attr_reader :imdb_id, :group

    def self.call(imdb_id, group)
      new(imdb_id, group).call
    end

    def initialize(imdb_id, group)
      @imdb_id = imdb_id
      @group = group
    end

    def call
      return if imdb_id.blank?

      group.movies << movie
      movie
    rescue ActiveRecord::RecordInvalid
      false
    end

    private

    def movie
      @movie ||= Movie.find_or_initialize_by(imdb_id:)
    end
  end
end
