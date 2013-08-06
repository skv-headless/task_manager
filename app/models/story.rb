class Story < ActiveRecord::Base
  STATUSES = %w[new started finished accepted rejected]
  belongs_to :assigned_to, :class_name => 'User'

  attr_accessible :description, :title, :assigned_to_id, :status

  validates :title, presence: true
  validates :description, presence: true
  validates :status, inclusion: STATUSES

  def status
    self[:status] ? STATUSES[self[:status]] : ''
  end
end
