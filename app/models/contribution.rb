class Contribution < ActiveRecord::Base
  belongs_to :person
  belongs_to :contributable, :polymorphic => true

  validates :role,          :presence => true
  validates :person,        :presence => true
  validates :contributable, :presence => true
end
