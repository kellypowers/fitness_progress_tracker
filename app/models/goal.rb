class Goal < ActiveRecord::Base
    has_many :workouts, through: :workout_goals
    belongs_to :user
    has_many :days, through: :workouts

end

