class Task < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :task_routines
  has_many :routines, through: :task_routines


  def add_routine(routine)
    self.routines << routine
    self.save
    self
  end

end
