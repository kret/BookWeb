class Publication < ActiveRecord::Base
  attr_accessible :title, :description

  validates :title,       :presence => true
  validates :description, :presence => true

  has_many :editions, :dependent => :destroy
end
