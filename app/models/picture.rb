class Picture < ActiveRecord::Base
  attr_accessible :pict_file
  mount_uploader :pict_file, ImageUploader
end
