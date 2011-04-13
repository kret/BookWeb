# == Schema Information
#
# Table name: people
#
#  id            :integer         not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  date_of_birth :date
#  date_of_death :date
#  created_at    :datetime
#  updated_at    :datetime
#

class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates :first_name,  :presence => true
  validates :last_name,   :presence => true

  has_many :contributions,  :dependent => :destroy
  has_many :author_of,      :through => :contributions,
                            :class_name => "Publication",
                            :source => :contributable,
                            :source_type => "Publication",
                            :conditions => "contributions.role_id = 1"
  has_many :translator_of,  :through => :contributions,
                            :class_name => "Edition",
                            :source => :contributable,
                            :source_type => "Edition",
                            :conditions => "contributions.role_id = 3"
  has_many :illustrator_of, :through => :contributions,
                            :class_name => "Edition",
                            :source => :contributable,
                            :source_type => "Edition",
                            :conditions => "contributions.role_id = 2"
end
