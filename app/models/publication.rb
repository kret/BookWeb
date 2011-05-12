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
  attr_accessible :title, :original_title, :new_edition_attributes, :existing_edition_attributes, :au_ids
  attr_reader :au_ids

  validates :title,   :presence => true
  validates :au_ids,  :presence => true,
                      :format => { :with => /(\d+ *,? *)+/ }
  validate :au_ids,   :valid_au_ids

  after_validation :make_builds

  has_many :editions,       :autosave => true,
                            :dependent => :destroy
  has_many :contributions,  :autosave => true,
                            :as => :contributable,
                            :dependent => :destroy
  has_many :authors,        :through => :contributions,
                            :class_name => "Person",
                            :source => :person,
                            :conditions => "contributions.role_id = 1"

  def cover
    most_popular_editions[0].cover
  end

  def page_pictures
    most_popular_editions[0].page_pictures
  end

  def authors_other_books(lim=5)
    other_books = {}
    authors.reject { |a| a.author_of.size <= 1 }.each do |a|
      other_books[a] = a.author_of.limit(lim) - [self]
    end
    other_books
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

  def au_ids=(ids)
    @au_ids = ids.collect(&:to_i).uniq
  end

  protected

    def valid_au_ids
      begin
        Person.find au_ids if au_ids
      rescue ActiveRecord::RecordNotFound
        errors[:au_ids] << I18n.translate('publication.validation.au_ids.record_not_valid')
      end
    end

    def make_builds
      if errors[:au_ids].empty?
        au_ids.each do |i|
          contributions.build({ :person => Person.find(i), :contributable => self, :role_id => 1 })
        end
      end
    end
end
