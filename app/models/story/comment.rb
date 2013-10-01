class Story::Comment < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :story
  attr_accessible :text, :author, :story, :story_id, :parent_id
  has_ancestry
end
