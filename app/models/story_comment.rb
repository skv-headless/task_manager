class StoryComment < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  attr_accessible :text, :author, :story_id
end
