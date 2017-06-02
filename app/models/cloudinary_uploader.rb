class CloudinaryUploader < CarrierWave::Uploader::Base
  include CarrierWave::Compatibility::Paperclip
  include Cloudinary::CarrierWave

  process convert: 'png'
  # Spree looks in attachment#errors, so just delegate to model#errors
  delegate :errors, to: :model
  delegate :after_save, to: :model
  delegate :after_commit, to: :model
  delegate :dirty?, to: :model


  # Match the path defined in Spree::Image
  def paperclip_path
    ":rails_root/public/spree/products/:id/:style/:basename.:extension"
  end

  def flush_errors
  end

  def dirty?
    false
  end

  def queue_all_for_delete
  end

  def flush_deletes
  end

  def save
  end

  # These are the versions defined in Spree::Image
  version :mini do
    process :resize_to_fit => [48, 48]
  end

  version :small do
    process :resize_to_fit => [100, 100]
  end

  version :product do
    process :resize_to_fit => [240, 240]
  end

  version :large do
    process :resize_to_fit => [600, 600]
  end
end