class RemoveTitleFromEditions < ActiveRecord::Migration
  def self.up
    remove_column :editions, :title
    remove_column :editions, :language
  end

  def self.down
    add_column :editions, :title, :string
    add_column :editions, :language, :string
  end
end
