class Day < ActiveRecord::Base
    has_many :workouts, through: :workout_days
    has_many :goals, through: :workouts

end