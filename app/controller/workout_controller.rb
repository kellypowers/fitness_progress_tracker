require 'pry'
require 'rack-flash'
class WorkoutController < ApplicationController
    #functionality to delete individual routines when editing a workout programs
    #
    
    get '/workouts' do 
        @user = User.find(session[:user_id])
        erb :'/workouts/index'
    end

    get '/workouts/new' do 
        @user = User.find_by_id(params[:id])
        #@workouts = @user.workouts
        # @workouts = Workout.all
        erb :'/workouts/new'
    end

    get '/workouts/:id/add' do 
        @user = User.find_by_id(params[:id])
        @workout = Workout.find_by_id(params[:id])
        @workouts = Workout.all
        @workoutid = "#{@workout.id}"
        erb :'/routines/new'
    end
    

    get '/workouts/:id' do 
         #binding.pry
        @user = User.find(session[:user_id])
        @workout = Workout.find_by_id(params[:id])
        # if @workout.routines != nil
            @routines = @workout.routines
        # end
        #binding.pry
        erb :'/workouts/show'
    end

    get '/workouts/:id/edit' do 
        @user = User.find(session[:user_id])
        @workouts = @user.workouts
        @workout = Workout.find_by_id(params[:id])
        erb :'workouts/edit'
    end

    post '/workouts' do 
        @user = User.find(session[:user_id])
        @workout = Workout.create(params["workout"])
        @workout.user_id = @user.id

        redirect to  "/workouts/#{@workout.id}"
    end

#will patch and post to same route work as seperate things?
    post '/workouts/:id' do 
        #binding.pry
        @user = User.find(session[:user_id])
        @workout = Workout.find(params[:id])
        @routine = Routine.create(params["routine"])
        @workout.user_id = @user.id
        # @routine.update(params["routine"]["name"])
        @routine.workout_id = @workout.id
        # @workout.routines << @routine
        @workout.save
        @routine.save
        #binding.pry
        redirect to "/workouts/#{@workout.id}"
    end

    patch "/workouts/:id" do 
        @user = User.find(session[:user_id])
        @workout = Workout.find(params[:id])
        @routines = @workout.routines
        @workout.name = params["workout"]["name"]
        #binding.pry
        redirect to "/workouts/#{@workout.id}"
    end

      post '/workouts/:id/add' do 
        @user = User.find(session[:user_id])
        @workout = Workout.find(params[:id])
        @routine = Routine.create(params["routine"])
        @routine.workout_id = @workout.id
        @workout.save
        @routine.save
        #binding.pry
        redirect to "/workouts/#{@workout.id}"

      end

#this not in use, need a way to get routine id to define since we are editing routines. right now it goes to routine controller, which i want to redirecd to this controller OR use this route.
    patch "/workouts/:id/add" do 
        binding.pry
        @user = User.find(session[:user_id])
        @routine = Routine.find_by_id(params[:id])
        #@routines = @workout.routines
        @workout = Workout.find_by_id(params[:id])
        @routine.update(params["routine"])
        #@routine.workout_id = @workout.id
        # @workout.routines << @routine
        # @routine.save
        # @workout.save
        
        #can i redirect to another controller from this controller?
        redirect to "/workouts/#{@workout.id}"
        
        
      end
  
  
      delete "workouts/:id" do 
        Workout.destroy(params[:id])
        redirect to "/workouts"
      end
end