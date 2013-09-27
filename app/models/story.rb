class Story < ActiveRecord::Base
  belongs_to :assigned_to, :class_name => 'User'
  has_many :story_comments
  has_many :story_attachments

  attr_accessible :description, :title, :assigned_to_id, :state, :state_event

  validates_presence_of :title, :description

  state_machine :initial => :new do
    state :new
    state :started
    state :finished
    state :accepted
    state :rejected

    event :start do
      transition [:new, :started, :accepted, :rejected] => :started
    end

    event :finish do
      transition [:accepted, :started] => :finished
    end

    event :accept do
      transition [:new, :started, :accepted, :rejected] => :accepted
    end

    event :reject do
      transition [:new, :started, :accepted, :rejected] => :rejected
    end
  end
end
