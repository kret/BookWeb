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

class EditionContribution < Contribution
end
