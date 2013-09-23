class StoryComment < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :story
  attr_accessible :text, :author, :story
end
