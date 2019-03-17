class Task < ActiveRecord::Base

  belongs_to :user
  belongs_to :routine

  #has_many users
  #has_many routines_trheough users


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
