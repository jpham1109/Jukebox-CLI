class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
      t.string :length
      t.integer :genre_id
      t.integer :year
      t.string :url
    end 
  end
end
