class StoryAttachment < ActiveRecord::Base
  belongs_to :story
  attr_accessible :path
end
