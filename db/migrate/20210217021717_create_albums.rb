class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :artist_id
      t.string :name
      t.integer :year
    end
  end
end
