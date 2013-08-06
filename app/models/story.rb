class Story < ActiveRecord::Base
  STATUSES = ['one', 'two']
  belongs_to :assigned_to, :class_name => 'User'

  attr_accessible :description, :title, :assigned_to_id
  attr_writer :status

  def status
    self[:status] ? STATUSES[self[:status]] : ''
  end
end
