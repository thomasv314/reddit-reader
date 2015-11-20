class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.datetime :posted
      t.string :category 
      t.string :title
      t.string :url
      t.string :image_url
      t.timestamps
    end
    add_index :favorites, :url
  end

  def self.down
    drop_table :favorites
  end
end
