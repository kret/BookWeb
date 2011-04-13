class CleanUpModelFields < ActiveRecord::Migration
  def self.up
    remove_column :editions, :edition_year
    add_column :editions, :edition_date, :date
    add_column :editions, :series, :string
    remove_column :editions, :number_of_tomes
    add_column :editions, :original_price, :string
    add_column :editions, :page_count, :integer
    add_column :editions, :cover_type, :string
    add_column :editions, :dimentions_width, :integer
    add_column :editions, :dimentions_height, :integer
    remove_column :editions, :translator

    add_column :publications, :original_title, :string
  end

  def self.down
    remove_column :editions, :edition_date
    add_column :editions, :edition_year, :string
    remove_column :editions, :series
    add_column :editions, :number_of_tomes, :integer
    remove_column :editions, :original_price
    remove_column :editions, :page_count
    remove_column :editions, :cover_type
    remove_column :editions, :dimentions_width
    remove_column :editions, :dimentions_height
    add_column :editions, :translator, :string

    remove_column :publications, :original_title
  end
end
