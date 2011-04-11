class Publication < ActiveRecord::Base
  attr_accessible :title

  validates :title, :presence => true

  has_many :editions,       :dependent => :destroy
  has_many :contributions,  :as => :contributable,
                            :dependent => :destroy
  has_many :authors,        :through => :contributions,
                            :class_name => "Person",
                            :conditions => "contributions.role = 1"
end
