class Task < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :task_routines
  has_many :routines, through: :task_routines

  has_many :task_users
  has_many :users, through: :task_users



  def self.unique_names
    names = Array.new
    ret = Array.new
    Task.all.each do |task|
      if !names.include?(task.name)
        names << task.name
        ret << task
      end
    end
    ret
  end

end
