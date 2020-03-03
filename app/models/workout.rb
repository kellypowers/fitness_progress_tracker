class Workout < ActiveRecord::Base
belongs_to :user

    def date_printed
        date = self.date.to_s
        item = Date.parse(date)
        "#{Date::MONTHNAMES[item.month]} #{item.day}, #{item.year}"
    end

    def self.workout_name_unique
        workouts_array = []
        self.all.each do |workout|
            workouts_array << workout.name
        end
         workouts_array.uniq!
    end

#     Type of workout: <br>
# <%if !Workout.all.empty?%>%
#   <% "Select from previous workouts \n or \n" %>
#   <%Workout.workout_name_unique.each do |name|%>
#     <%=name%> <input type="checkbox" name="user[workout_ids][]">
#     <%end%>
#   <%else%>
#     <% nil %>
# <%end%>



end