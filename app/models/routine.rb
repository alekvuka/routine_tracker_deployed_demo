class Routine < ActiveRecord::Base

    has_many :user_routines
    has_many :task_routines

    has_many :tasks, through: :task_routines
    has_many :users, through: :user_routines


    def self.times
      ['1:00am', '2:00am', '3:00am', '4:00am', '5:00am','6:00am',
       '7:00am', '8:00am', '9:00am', '10:00am', '11:00am', '12:00pm',
       '1:00pm', '2:00pm', '3:00pm', '4:00pm','5:00pm','6:00pm',
       '7:00pm', '8:00pm', '9:00pm', '10:00pm', '11:00pm', '12:00am'  ]
    end


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
