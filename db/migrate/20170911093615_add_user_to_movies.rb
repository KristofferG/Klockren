class AddUserToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :user, :string
    add_column :movies, :comment, :string
  end
end
