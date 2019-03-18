class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }

  validates_confirmation_of :password


  has_many :task_users
  has_many :user_routines

  has_many :tasks, through: :task_users
  has_many :routines, through: :user_routines


  def number_of_routines
    self.routines.count
  end

  def number_of_tasks
    self.tasks.count
  end

  def current_routine
    #binding.pry
  end

  def upcoming_routine
  end

end
