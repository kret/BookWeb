class Edition < ActiveRecord::Base
  attr_accessible :title, :isbn, :edition_year, :issue_number, :language, :number_of_tomes

  validates :title,         :presence => true
  validates :isbn,          :presence => true
  validates :edition_year,  :presence => true
  validates :language,      :presence => true

  belongs_to :publication
end
