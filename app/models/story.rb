class Story < ActiveRecord::Base
  belongs_to :assigned_to, :class_name => 'User'
  has_many :story_comments

  attr_accessible :description, :title, :assigned_to_id, :state

  validates_presence_of :title, :description

  state_machine :initial => :new do
    event :new do
      transition all => :new
    end

    event :started do
      transition all => :started
    end

    event :finished do
      transition all => :finished
    end

    event :accepted do
      transition all => :accepted
    end

    event :rejected do
      transition all => :rejected
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
