class CreateGroupMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :group_movies do |t|
      t.references :group, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
