class WorkoutDay < ActiveRecord::Base
    belongs_to :workout
    belongs_to :day
end