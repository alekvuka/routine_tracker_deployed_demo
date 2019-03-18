class Task < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :task_routines
  has_many :routines, through: :task_routines
  

  #has_many :task_users
  #has_many :users, through: :task_users

  def add_routine(routine)
    self.routines << routine
    self.save
    self
  end

  def add_user(user)
    self.users << User.find(user)
    self.save
    self
  end


end
