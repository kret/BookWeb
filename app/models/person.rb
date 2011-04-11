class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates :first_name,  :presence => true
  validates :last_name,   :presence => true

  has_many :contributions,  :dependent => :destroy
  has_many :author_of,      :through => :contributions,
                            :class_name => "Publication",
                            :conditions => "contributions.role = 1"
  has_many :translator_of,  :through => :contributions,
                            :class_name => "Edition",
                            :conditions => "contributions.role = 2"
  has_many :illustrator_of, :through => :contributions,
                            :class_name => "Edition",
                            :conditions => "contributions.role = 3"
end
