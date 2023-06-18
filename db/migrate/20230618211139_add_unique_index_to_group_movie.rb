class AddUniqueIndexToGroupMovie < ActiveRecord::Migration[7.0]
  def change
    add_index(:group_movies, [:group_id, :movie_id], unique: true)
  end
end
