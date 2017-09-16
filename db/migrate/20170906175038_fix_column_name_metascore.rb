class FixColumnNameMetascore < ActiveRecord::Migration[5.1]
  def change
    rename_column :movies, :rottenTomatoes, :metascore
  end
end
