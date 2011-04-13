# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  parent_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  belongs_to :parent, :class_name => "Category"
end
