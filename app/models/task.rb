class Task < ActiveRecord::Base

  belongs_to :user
  belongs_to :routine

  def self.unique_names

    names = Array.new

    Task.all.each do |task|
      if !names.include?(task)
        names << task
      end
    end

    names

  end

end
