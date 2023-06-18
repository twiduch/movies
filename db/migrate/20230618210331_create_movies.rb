class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :poster
      t.string :plot
      t.string :imdb_id
      t.string :movie_type

      t.timestamps
    end
    add_index :movies, :imdb_id
  end
end
