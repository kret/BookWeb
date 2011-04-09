class Publication < ActiveRecord::Base
  attr_accessible :title

  validates :title, :presence => true

  has_many :editions, :dependent => :destroy
  has_many :contributions, :as => :contributable, :dependent => :destroy
end
