class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :actors
      t.string :plot
      t.string :poster
      t.string :imdb
      t.string :rottenTomatoes

      t.timestamps
    end
  end
end
