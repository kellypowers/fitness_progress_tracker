class Goal < ActiveRecord::Base
    # has_many :workout_goals
    belongs_to :user

end