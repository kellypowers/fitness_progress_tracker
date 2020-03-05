require 'pry'
require 'rack-flash'
class RoutineController < ApplicationController
    #functionality to delete individual routines when editing a workout programs
    #
    get "/workouts/:id/routines" do 
        @user = User.find(session[:user_id])
        @workout = Workout.find_by_id(params[:id])
        #binding.pry
        erb :"routines/new"
    end

    get '/routines/:id' do 
         #binding.pry
        @user = User.find(session[:user_id])
        @routine = Routine.find_by_id(params[:id])
        # if @workout.routines != nil
            #@routines = @workout.routines
        # end
        #binding.pry
        erb :'/workouts/edit'
    end

    get '/routines/:id/edit' do 
        @user = User.find(session[:user_id])
        @routines = @user.routines
        @routine = Routine.find_by_id(params[:id])
        @workout = Workout.find_by_id(@routine.workout_id)
        
        erb :'/routines/edit'
    end


    patch "/routines/:id" do 
        @user = User.find(session[:user_id])
        @routine = Routine.find_by_id(params[:id])
        #@routines = @workout.routines
        @workout = Workout.find_by_id(@routine.workout_id)
        @routine.update(params["routine"])
        #@routine.workout_id = @workout.id
        # @workout.routines << @routine
        # @routine.save
        # @workout.save
        
        #can i redirect to another controller from this controller?
        redirect to "/workouts/#{@workout.id}"
        
        
      end
  
  
      delete "/routines/:id" do 
        Routine.destroy(params[:id])
        redirect to "/workouts"
      end
end