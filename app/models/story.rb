class Story < ActiveRecord::Base
  belongs_to :assigned_to, :class_name => 'User'
  has_many :comments, :dependent => :destroy
  has_many :attachments, :dependent => :destroy

  attr_accessible :description, :title, :assigned_to_id, :state, :state_event,
                  :attachments_attributes

  validates_presence_of :title, :description

  accepts_nested_attributes_for :attachments,
                                :reject_if => :all_blank,
                                :allow_destroy => true

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
