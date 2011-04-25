class FixPictureEditionsForeignKey < ActiveRecord::Migration
  def self.up
    rename_column :pictures, :editions_id, :edition_id
  end

  def self.down
    rename_column :pictures, :edition_id, :editions_id
  end
end
