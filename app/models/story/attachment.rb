class Story::Attachment < ActiveRecord::Base
  attr_accessible :path

  belongs_to :story

  mount_uploader :path, StoryAttachmentUploader
end
