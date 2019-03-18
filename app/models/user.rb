class User < ActiveRecord::Base


  has_many :user_routines
  has_many :routines, through: :user_routines
  has_many :tasks, through: :routines


  has_secure_password

  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6,  allow_nil: true  }


  def number_of_routines
    self.routines.count
  end

  def number_of_tasks
    self.tasks.count
  end

  def current_routine
    self.routines.map do |routine|
      if DateTime.parse(routine.start_time).strftime("%H").to_i <= Time.now.hour.to_i && DateTime.parse(routine.end_time).strftime("%H").to_i >= Time.now.hour.to_i
        routine
      end
     end
  end

  def upcoming_routine
    self.routines.map do |routine|
      if DateTime.parse(routine.end_time).strftime("%H").to_i >= Time.now.hour.to_i
        return routine
      end
     end
  end

end
