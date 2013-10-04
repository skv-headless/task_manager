class Story::AttachmentDecorator < Draper::Decorator
  def link
    h.link_to(object.path.file.filename, object.path.url, :target => '_blank')
  end
end
