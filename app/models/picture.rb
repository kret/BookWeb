class Picture < ActiveRecord::Base
  attr_accessible :image, :remote_image_url, :image_cache, :remove_image

  mount_uploader :image, PictureUploader

  belongs_to :edition
end
