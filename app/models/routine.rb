# class Routine < Workout
class Routine < ActiveRecord::Base
    belongs_to :workout
    has_many :users, through: :workouts  #is this true?

    # def value_if_nil(method)
    #     if self.method == nil 
    #         return ""
    #     else
    #         self.method
    #     end
    # end
    
    #how do i get this in views?
    
    def if_nil(argument)
        if argument == nil 
            ""
        else
            argument
        end
    end
end