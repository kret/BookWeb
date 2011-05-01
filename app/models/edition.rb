# == Schema Information
#
# Table name: editions
#
#  id                :integer         not null, primary key
#  isbn              :string(255)
#  issue_number      :string(255)
#  publication_id    :integer
#  created_at        :datetime
#  updated_at        :datetime
#  description       :text
#  cover_id          :integer
#  editor_id         :integer
#  edition_date      :date
#  series            :string(255)
#  original_price    :string(255)
#  page_count        :integer
#  cover_type        :string(255)
#  dimentions_width  :integer
#  dimentions_height :integer
#

class Edition < ActiveRecord::Base
  attr_accessible :description, :isbn, :series, :edition_date,
                  :issue_number, :original_price, :page_count,
                  :cover_type, :dimentions_width, :dimentions_height,
                  :cover_attributes, :new_pictures_attributes, :existing_pictures_attributes

  validates :description,   :presence => true
  validates :isbn,          :presence => true
  validates :edition_date,  :presence => true

  belongs_to :publication
  belongs_to :editor
  has_many :contributions,  :as => :contributable,
                            :dependent => :destroy
  has_many :translators,    :through => :contributions,
                            :class_name => "Person",
                            :source => :person,
                            :conditions => "contributions.role_id = 3"
  has_many :illustrators,   :through => :contributions,
                            :class_name => "Person",
                            :source => :person,
                            :conditions => "contributions.role_id = 2"
  belongs_to :cover,        :class_name => "Picture",
                            :dependent => :destroy
  has_many :all_pictures,   :class_name => "Picture",
                            :autosave => true,
                            :dependent => :destroy

  def pictures
    all_pictures - [cover]
  end

  def cover_attributes=(cover_attributes)
    if cover
      if cover_attributes
        cover.attributes = cover_attributes
      else
        cover.delete
      end
    else
      cover = build_cover(cover_attributes)
    end
  end

  def new_pictures_attributes=(new_pics_attributes)
    new_pics_attributes.each do |pic_attributes|
      all_pictures.build(pic_attributes)
    end
  end

  def existing_pictures_attributes=(existing_pics_attributes)
    all_pictures.reject(&:new_record?).each do |picture|
      attributes = existing_pics_attributes[picture.id.to_s]
      if attributes
        picture.attributes = attributes
      else
        all_pictures.delete(picture)
      end
    end
  end
end
