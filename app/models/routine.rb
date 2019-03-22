class Routine < ActiveRecord::Base

    has_many :user_routines
    has_many :task_routines

    has_many :tasks, through: :task_routines
    has_many :users, through: :user_routines

    scope :order_by_start_time, -> { self.order(:start_time) }
    scope :order_my_routines, -> (user) { user.routines.order(:start_time)}


    def self.times
      ['1:00am', '2:00am', '3:00am', '4:00am', '5:00am','6:00am',
       '7:00am', '8:00am', '9:00am', '10:00am', '11:00am', '12:00pm',
       '1:00pm', '2:00pm', '3:00pm', '4:00pm','5:00pm','6:00pm',
       '7:00pm', '8:00pm', '9:00pm', '10:00pm', '11:00pm', '12:00am' ]
    end


    def add_tasks(tasks)

      tasks[:task_id].each do |task|
          if !task.empty?
            task = Task.find(task)
            self.tasks << task
            task.save
          end
       end

       tasks.delete(:task_id)

       tasks.each do |key, value|
         if !value.empty?
           task = Task.find_or_create_by(name: value)
           self.tasks << task
           task.save
         end
       end

    end



    def self.convert_to_24(hour)
      DateTime.parse(hour).strftime("%H:%M").strip
    end

    def self.convert_from_24(hour)
      DateTime.parse(hour).strftime("%l:%M%P").strip
    end

    def current_hour
      Time.now.hour.to_i
    end

    def begin_hour
      DateTime.parse(self.start_time).strftime("%H").to_i
    end

    def end_hour
      routine_end_hour = DateTime.parse(self.end_time).strftime("%H").to_i

      if routine_end_hour < self.begin_hour
        routine_end_hour = routine_end_hour + 24
      end

      routine_end_hour
    end

end
