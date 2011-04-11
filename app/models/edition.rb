class Edition < ActiveRecord::Base
  attr_accessible :title, :description, :isbn, :edition_year, :issue_number, :language, :number_of_tomes

  validates :title,         :presence => true
  validates :description,   :presence => true
  validates :isbn,          :presence => true
  validates :edition_year,  :presence => true
  validates :language,      :presence => true

  belongs_to :publication
  has_many :contributions, :as => :contributable, :dependent => :destroy
  has_one :cover, :class_name => "Picture", :foreign_key => "cover_id", :dependent => :destroy
  has_many :pictures, :dependent => :destroy
end
