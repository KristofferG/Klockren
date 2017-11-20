class AddCommentsCountToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :comments_count, :integer
  end
end
