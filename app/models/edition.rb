# == Schema Information
#
# Table name: editions
#
#  id                :integer         not null, primary key
#  isbn              :string(255)
#  issue_number      :string(255)
#  publication_id    :integer
#  created_at        :datetime
#  updated_at        :datetime
#  description       :text
#  cover_id          :integer
#  editor_id         :integer
#  edition_date      :date
#  series            :string(255)
#  original_price    :string(255)
#  page_count        :integer
#  cover_type        :string(255)
#  dimentions_width  :integer
#  dimentions_height :integer
#

class Edition < ActiveRecord::Base
  attr_accessible :description, :isbn, :series, :edition_date, :issue_number, :original_price, :page_count, :cover_type, :dimentions_width, :dimentions_height

  validates :description,   :presence => true
  validates :isbn,          :presence => true
  validates :edition_date,  :presence => true

  belongs_to :publication
  belongs_to :editor
  has_many :contributions,  :as => :contributable,
                            :dependent => :destroy
  has_many :translators,    :through => :contributions,
                            :class_name => "Person",
                            :source => :person,
                            :conditions => "contributions.role_id = 3"
  has_many :illustrators,   :through => :contributions,
                            :class_name => "Person",
                            :source => :person,
                            :conditions => "contributions.role_id = 2"
  has_one :cover,           :class_name => "Picture",
                            :dependent => :destroy
  has_many :pictures,       :dependent => :destroy
end
