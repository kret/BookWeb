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
                  :cover_attributes, :new_pictures_attributes, :existing_pictures_attributes,
                  :tr_ids, :il_ids
  attr_reader :tr_ids, :il_ids

  validates :description,   :presence => true
  validates :isbn,          :presence => true
  validates :edition_date,  :presence => true
  validates :tr_ids,        :format => { :with => /(\d+ *,? *)+/ }
  validate :tr_ids,         :valid_tr_ids
  validates :il_ids,        :format => { :with => /(\d+ *,? *)+/ }
  validate :il_ids,         :valid_il_ids

  after_validation :make_builds

  belongs_to :publication
  belongs_to :editor
  has_many :contributions,  :as => :contributable,
                            :autosave => true,
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
  has_many :pictures,       :class_name => "Picture",
                            :autosave => true,
                            :dependent => :destroy

  def page_pictures
    pictures - [cover]
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
      pictures.build(pic_attributes)
    end
  end

  def existing_pictures_attributes=(existing_pics_attributes)
    pictures.reject(&:new_record?).each do |picture|
      attributes = existing_pics_attributes[picture.id.to_s]
      if attributes
        picture.attributes = attributes
      else
        pictures.delete(picture)
      end
    end
  end

  def tr_ids=(ids)
    @tr_ids = ids.collect(&:to_i).uniq
  end

  def il_ids=(ids)
    @il_ids = ids.collect(&:to_i).uniq
  end

  protected

    def valid_tr_ids
      begin
        Person.find tr_ids
      rescue ActiveRecord::RecordNotFound
        errors[:tr_ids] << I18n.translate('edition.validation.tr_ids.record_not_valid')
      end
    end

    def valid_il_ids
      begin
        Person.find il_ids
      rescue ActiveRecord::RecordNotFound
        errors[:il_ids] << I18n.translate('edition.validation.il_ids.record_not_valid')
      end
    end

    def make_builds
      if tr_ids && errors[:tr_ids].empty?
        tr_ids.each do |i|
          contributions.build({ :person => Person.find(i), :contributable => self, :role_id => 3 })
        end
      end

      if il_ids && errors[:il_ids].empty?
        il_ids.each do |i|
          contributions.build({ :person => Person.find(i), :contributable => self, :role_id => 2 })
        end
      end
    end
end
