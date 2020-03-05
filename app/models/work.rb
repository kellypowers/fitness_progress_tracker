
# # #     <%# put this logic in the controller %>
    
# # #     <%(!Workout.all.empty?) ?  "Select from previous workouts \n or \n" : nil %>
# # #     <br>
# # #     <%workouts_array = []%>
# # #     <%@workouts.each do |workout|%>
# # #         <%workouts_array << workout.name%>
# # #     <%end%>

# # #     <%workouts_array.uniq!%>
# # #     <%workouts_array.each do |each|%>
# # #         <%=each%> <input type="checkbox" name="user[workout_ids][]">
# # #     <%end%>
# # #         <br>

# # # <%# make this so that it shows only unique routine names with a model function %>
# # #     Select from existing workout type <%#routine%>
# # #     <%@workouts.each do |workout|%>
# # #         <%workout.routines.each do |routine|%>
# # #             <input type="radio" name="workout[routine_ids][]" value="<%=routine.name%>"> <%=routine.name%>
# # #         <%end%>
# # #     <%end%>

# # #     Add new type of workout, fill out name and any applicable items:
        
# # #     <ul>
# # #         <li>Add new workout type <input id="routine_name" type="text" name="routine[name]" required></li>
# # #         <li>Distance <input id="distance" type="integer" name="routine[distance]"> miles </li>
# # #         <li>Time: <input id="workout_time" type="integer" name="routine[time]"> seconds <input type="radio" name="routine[time_units]" value="seconds"> Min<input type="radio" name="routine[time_units]" value="minutes"> Hr<input type="radio"name="routine[time_units]" value="hour(s)"> </li>
# # #         <li>Number:<input id="number" type="integer" name="routine[number]"></li>
# # #         <li>Reps: <input id="reps" type="integer" name="routine[reps]"></li>
# # #         <li> Weight: <input id="routine" type="integer" name="routine[weight]">lbs </li>
# # #         <input type="submit" value="Add to workout">
# # #     </ul>
# # # </form> 


# # # <a class="button" href="/workouts">Workouts</a>
# # # <a class="button" href="/">Home</a>



# # <!--
# #     <%if routine.distance != nil%>
# #         Distance <%=routine.distance%>
# #     <%end%>
# #     <%if routine.time != nil%>
# #         Distance <%=routine.time%>
# #     <%end%>
# #     <%if routine.distance != nil%>
# #         Distance <%=routine.distance%>
# #     <%end%>
# # <%end%>

# # Add New Workout to <%=@workout.name%>


# # <!--
# # <ul>   
# #         <li><%=@workout.date_printed%></li>
# #                 <%if @workout.distance != nil%>
# #                         <li>Distance: <%=@workout.distance%></li>
# #                 <%end%>

# #                 <%if @workout.time != nil%>
# #                         <li>Time: <%=@workout.time%>
# #                 <%end%>
# #                 <%if @workout.time_units != nil%>
# #                         <%=@workout.time_units%></li> 
# #                 <%end%>
# #                 <%if @workout.reps != nil%>
# #                         <li>Reps: <%=@workout.reps%></li> 
# #                 <%end%>
# #                 <%if @workout.number_reps != nil%>
# #                         <li>Number of Reps: <%=@workout.number_reps%></li> 
# #                 <%end%>
# #                 <%if @workout.weight != nil%>
# #                         <li>Weight: <%=@workout.weight%></li> 
# #                 <%end%>
# #         </ul>
# # Add New Workout to <%=@workout.name%>
# # </ul> 


# patch "/workouts/:id" do 
#     # @workout = Workout.find(params[:id])
#     # @user = User.find(session[:user_id])
#     # @workout.update(params[:workout])
#     # @user.update(params[:user])
#     # params["workout"].each do |key, value|
#     #     binding.pry
#     #     if value = ""
#     #         @workout.send("#{key}") = null
#     #     else
#     #         @workout.send("#{key}") = value
#     #     end
#     # end
#     @user = User.find(session[:user_id])
#     @workout = Workout.find(params[:id])
#     @routines = @workout.routines
#     #@routine = Routine.create(name: params["routine"])
#     # @routine.update(params["routine"]["name"])
#     #@routine.workout_id = @workout.id
#     # @workout.routines << @routine
#     #@workout.save
#     #@routine.save
#     redirect to "/workouts/#{@workout.id}"
    
#   end

# <form method="post" action="/routines/<%=routine.id%>">
# <input id="hidden" type="hidden" name="_method" value="patch">
# <input type="submit" value="Edit routine">


# <h2>Edit Routine </h2>
# <%# make a workout be able to have multiple things... so find a workout online ex// 10 reps of 10 squats + whatever, and set that into a workout title. may have to edit the workout page. workouts-category-  add each workouttype to this category.   %>
# <!-- make this html pretty -->
# <form action="/routines/<%=@routine.id%>" method="post">
# <input type="hidden" name="_method" value="patch">
# <%# <%@user.workouts.each do |workout|%> %>
# <%@workouts.each do |workout|%>
# <%=workout.type%><input id="workout_<%=workout.id%>" type="checkbox" name="user[workout_ids][]" value="<%=workout.id%>"><%='checked' if @user.workout_ids.include?(workout.id)%>><br>
#     <%end%>
#     <label for="new_workout_type">Workout Type</label>
#     <input id="new_workout_type" type="text" name="workout[type]" value="<%=@workout.type%>">

#     <label for="workout_date">Workout Date</label>
#     <input id="workout_date" type="datetime" name="workout[date]" value="<%=@workout.date%>">

#     <label for="workout_distance">Distance</label>
#     <input id="workout_distance" type="texintegert" name="workout[distance]" value="<%=@workout.distance%>"> miles

#     <label for="workout_time">Time:</label>
#     <input id="workout_time" type="integer" name="workout[time]" value="<%=@workout.time%>"> <%if checked minutes<%='checked' if @workout.time.units.include?(workout.id)%>>

#     <label for="workout_reps">Reps</label>
#     <input id="workout_reps" type="integer" name="workout[reps]" value="<%=@workout.reps%>">

#     <label for="workout_number_reps">Number of reps</label>
#     <input id="workout_number_reps" type="integer" name="workout[number_reps]" value="<%=@workout.number_reps%>">

#     <label for="workout_weight">Weight:</label>
#     <input id="workout_weight" type="integer" name="workout[weight]" value="<%=@workout.weight%>">lbs

#     <br>

#     <input type="submit" value="Edit Workout">
# </form> 

# <a class="button" href="/workouts">Workouts</a>
# <a class="button" href="/">Home</a>