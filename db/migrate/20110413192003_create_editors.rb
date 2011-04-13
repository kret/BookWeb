class CreateEditors < ActiveRecord::Migration
  def self.up
    create_table :editors do |t|
      t.string :name

      t.timestamps
    end
    remove_column :editions, :editor
    add_column :editions, :editor_id, :integer
  end

  def self.down
    drop_table :editors
    remove_column :editions, :editor_id
    add_column :editions, :editor, :string
  end
end
