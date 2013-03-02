class Picture < ActiveRecord::Base
  attr_accessible :pict_file, :title
  mount_uploader :pict_file, ImageUploader

  def image_name
  	File.basename(pict_file.path || pict_file.filename) if pict_file
  end
end
