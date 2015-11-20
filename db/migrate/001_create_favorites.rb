class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.string :title
      t.string :url
      t.string :image_url
      t.time :posted
      t.timestamps
    end
  end

  def self.down
    drop_table :favorites
  end
end