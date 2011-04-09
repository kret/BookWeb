class CreateEditions < ActiveRecord::Migration
  def self.up
    create_table :editions do |t|
      t.string :title
      t.string :editor
      t.string :translator
      t.string :isbn
      t.string :edition_year
      t.string :issue_number
      t.string :language
      t.integer :number_of_tomes
      t.references :publication

      t.timestamps
    end
  end

  def self.down
    drop_table :editions
  end
end
