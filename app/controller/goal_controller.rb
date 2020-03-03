require 'pry'
require 'rack-flash'
class GoalController < ApplicationController
    get '/goals' do 
        @user = User.find(session[:user_id])
        erb :'goals/index'
    end

    get '/goals/new' do 
        
        erb :'goals/new'
    end

    get '/goals/:id' do 
        #@user = User.find(session[:user_id])
        @goal = Goal.find_by_id(params[:id])
        erb :'goals/show'
    end

    get '/goals/:id/edit' do 
        @user = User.find(session[:user_id])
        @goals = Goals.all
        @goal = Goal.find_by_id(params[:id])
        erb :'goals/edit'
    end

    # post '/goals' do 
    #     @goal = Goal.create(name: params["goal"]["name"])
    #     params["goal"].each do |key, value|
    #         binding.pry
    #         if value = ""
    #             @goal.send("#{key}") = null
    #         else
    #             @goal.send("#{key}") = value
    #         end
    #     end
    #     @goal.save
    # end

    patch "/goals/:id" do 
        @goal = Goal.find(params[:id])
  
  
        @goal.update(params[:goal])
        redirect to "/goals/#{@goal.id}"
      end
  
  
      delete "goals/:id" do 
        Goal.destroy(params[:id])
        redirect to "/landmarks"
      end
end