class Story::Comment < ActiveRecord::Base
  attr_accessible :text, :author, :story, :story_id, :parent_id

  belongs_to :author, :class_name => 'User'
  belongs_to :story

  validates :text, presence: true

  has_ancestry
end
