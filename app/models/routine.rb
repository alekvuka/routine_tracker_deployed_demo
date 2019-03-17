class Routine < ActiveRecord::Base

    has_many :tasks
    has_many :user_routines
    has_many :users, through: :user_routines



    def current_routine(user)
    end


    def upcoming_routine(user)
    end


    def add_tasks(tasks, user)

      tasks[:task_id].each do |task|
          if !task.empty?
            self.tasks << Task.create(name: Task.find(task).name, routine: self, user: User.find(user))
          end
       end

       tasks.delete(:task_id)

       tasks.each do |key, value|
         if !value.empty?
           self.tasks << Task.create(name: value, routine: self, user: User.find(user))
         end
       end

    end


end
