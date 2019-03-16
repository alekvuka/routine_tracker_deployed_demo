class Routine < ActiveRecord::Base

    has_many :tasks
    has_many :user_routines
    has_many :users, through: :user_routines

    def start_time
    end

    def end_time
    end

    def duration
    end 


end
