class MoveDescriptionFromPublicationToEdition < ActiveRecord::Migration
  def self.up
    remove_column :publications, :description
    add_column :editions, :description, :text
  end

  def self.down
    add_column :publications, :description, :text
    remove_column :editions, :description
  end
end
