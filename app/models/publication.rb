class Publication < ActiveRecord::Base
  attr_accessible :title

  validates :title, :presence => true

  has_many :editions, :dependent => :destroy
end
