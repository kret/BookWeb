# == Schema Information
#
# Table name: contributions
#
#  id                 :integer         not null, primary key
#  role_id            :integer
#  person_id          :integer
#  contributable_id   :integer
#  contributable_type :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class Contribution < ActiveRecord::Base
  validates :person,        :presence => true
  validates :contributable, :presence => true

  belongs_to :person
  belongs_to :contributable, :polymorphic => true
  belongs_to :role
end
