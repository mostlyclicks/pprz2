class Picture < ActiveRecord::Base
  attr_accessible :pict_file, :title
  mount_uploader :pict_file, ImageUploader

  after_save :enqueue_image

  def image_name
  	File.basename(pict_file.path || pict_file.filename) if pict_file
  end

  def enqueue_image
    ImageWorker.perform_async(id, key) if key.present?
  end

  class ImageWorker
    include Sidekiq::Worker
    
    def perform(id, key)
      picture = Picture.find(id)
      picture.key = key
      picture.remote_image_url = picture.pict_file.direct_fog_url(with_path: true)
      picture.save!
      picture.update_column(:image_processed, true)
    end
  end
end
