class Story < ActiveRecord::Base
  belongs_to :assigned_to, :class_name => 'User'
  has_many :story_comments

  attr_accessible :description, :title, :assigned_to_id, :state, :state_event

  validates_presence_of :title, :description

  state_machine :initial => :new do
    state :new
    state :started
    state :finished
    state :accepted
    state :rejected

    event :start do
      transition all - [:finished] => :started
    end

    event :finish do
      transition [:accepted, :started] => :finished
    end

    event :accept do
      transition all - [:finished] => :accepted
    end

    event :reject do
      transition all - [:finished] => :rejected
    end
  end

  after_save :send_assignment_email, :if => :send_assignment_email?

  def send_assignment_email
    StoryMailer.assignment_email(self).deliver
  end

  def send_assignment_email?
    'assigned_to_id'.in?(self.changed) && self.assigned_to_id.kind_of?(Integer)
  end
end
