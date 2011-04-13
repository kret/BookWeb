# == Schema Information
#
# Table name: editors
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Editor < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true
end
