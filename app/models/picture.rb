# == Schema Information
#
# Table name: pictures
#
#  id         :integer         not null, primary key
#  image      :string(255)
#  edition_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Picture < ActiveRecord::Base
  attr_accessible :image, :remote_image_url, :image_cache, :remove_image

  mount_uploader :image, PictureUploader

  belongs_to :edition
end
