class Story < ActiveRecord::Base
  belongs_to :assigned_to, :class_name => 'User'
  has_many :story_comments

  attr_accessible :description, :title, :assigned_to_id, :state

  validates_presence_of :title, :description

  state_machine :initial => :new do
    state :new
    state :started
    state :finished
    state :accepted
    state :rejected
  end
end
