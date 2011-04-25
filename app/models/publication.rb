# == Schema Information
#
# Table name: publications
#
#  id             :integer         not null, primary key
#  title          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  original_title :string(255)
#

class Publication < ActiveRecord::Base
  attr_accessible :title, :original_title, :new_edition_attributes, :existing_edition_attributes

  validates :title, :presence => true

  has_many :editions,       :dependent => :destroy
  has_many :contributions,  :as => :contributable,
                            :dependent => :destroy
  has_many :authors,        :through => :contributions,
                            :class_name => "Person",
                            :source => :person,
                            :conditions => "contributions.role_id = 1"

  after_update :save_editions

  def cover
    most_popular_editions[0].cover
  end

  def pictures
    most_popular_editions[0].pictures
  end

  def most_popular_editions
    mpe = []
    mpe << editions[0] unless editions[0].nil?
    mpe << editions[1] unless editions[1].nil?
    mpe
  end

  def new_edition_attributes=(edition_attributes)
    edition_attributes.each do |attributes|
      editions.build(attributes)
    end
  end

  def existing_edition_attributes=(edition_attributes)
    editions.reject(&:new_record?).each do |edition|
      attributes = edition_attributes[edition.id.to_s]
      if attributes
        edition.attributes = attributes
      else
        editions.delete(edition)
      end
    end
  end

  private

    def save_editions
      editions.each do |edition|
        edition.save(:validate => false)
      end
    end
end
