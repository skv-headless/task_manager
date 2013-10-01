module Web::Story::AttachmentsHelper
  # TODO FIXME перенести в draper
  def link_to_attachment(attachment)
    link_to(attachment.path.file.filename, attachment.path.url, :target => '_blank')
  end
end
