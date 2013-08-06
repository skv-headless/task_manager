class Story < ActiveRecord::Base
  STATUSES = %w[new started finished accepted rejected]
  belongs_to :assigned_to, :class_name => 'User'
  has_many :story_comments

  attr_accessible :description, :title, :assigned_to_id, :status

  validates_presence_of :title, :description
  validates :status, inclusion: STATUSES

  def status
    self[:status] ? STATUSES[self[:status]] : ''
  end
end
