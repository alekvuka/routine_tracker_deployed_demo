class UserRoutine < ActiveRecord::Base

  belongs_to :user
  belongs_to :task

end
