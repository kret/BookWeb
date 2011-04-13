# == Schema Information
#
# Table name: publications
#
#  id             :integer         not null, primary key
#  title          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  original_title :string(255)
#

class Publication < ActiveRecord::Base
  attr_accessible :title, :original_title

  validates :title, :presence => true

  has_many :editions,       :dependent => :destroy
  has_many :contributions,  :as => :contributable,
                            :dependent => :destroy
  has_many :authors,        :through => :contributions,
                            :class_name => "Person",
                            :source => :person,
                            :conditions => "contributions.role_id = 1"
end
