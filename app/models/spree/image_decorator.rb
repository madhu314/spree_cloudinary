Spree::Image.class_eval do
  mount_uploader :attachment, CloudinaryUploader, :mount_on => :attachment_file_name

  # Get rid of the paperclip callbacks
  def save_attached_files; end
  def prepare_for_destroy; end
  def destroy_attached_files; end

  def attachment_file_name
    attachment.file.filename
  end
end
