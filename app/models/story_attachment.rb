class StoryAttachment < ActiveRecord::Base
  belongs_to :story
  attr_accessible :path
  mount_uploader :path, StoryAttachmentUploader
end
