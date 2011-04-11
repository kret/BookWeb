class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :image
      t.references :editions

      t.timestamps
    end
    add_column :editions, :cover_id, :integer
  end

  def self.down
    drop_table :pictures
    remove_column :editions, :cover_id
  end
end
