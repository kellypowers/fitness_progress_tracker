require 'pry'
require 'rack-flash'
# Validate uniqueness of user login attribute (username or email).
# Validate user input so bad data cannot be persisted to the database.
#  Display validation failures to user with error messages.
# Ensure that users can edit and delete only their own resources - not resources created by other users.
class UserController < ApplicationController
    use Rack::Flash 

    get '/registrations/signup' do
        if logged_in?
            redirect to "/users/home"
        else
            erb :'/registrations/signup'
        end
    end
 
    post '/registrations' do
            @user = User.new(params[:user])
            if params[:user][:password] == params[:password2]
                @user.save
                session[:user_id] = @user.id
                redirect "/users/home"
            else
                flash[:message] = "Passwords don't match"
                redirect "/registrations/signup"
            # end
        end
    end

    get '/sessions/login' do
        if logged_in? 
            redirect to "/users/home"
        elsif @user = User.find_by(:email => params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id 
                redirect "/users/home"
            end
        else
            erb :"/sessions/login"
        end
    end

    post '/sessions' do
        @user = User.find_by(email: params["user"]["email"])
        if @user && @user.authenticate(params["user"]["password"])
            session[:user_id] = @user.id
            redirect '/users/home'
        else
            flash[:message] = "Invalid username/password. Please sign up."
            redirect '/registrations/signup'
        end
    end

    get '/sessions/logout' do
        session.clear
        redirect '/'
    end

    get '/users/home' do
        if logged_in?
            #binding.pry
            @user = User.find(session[:user_id])
            # @goals = @user.goals 
            #@workouts = Workout.all
            @workouts = @user.workouts
            #binding.pry
            erb :'/users/home'
        else
            erb :'/sessions/login'
        end
    end


    get '/users/account' do
        if logged_in?
            @user = User.find(session[:user_id])
            # binding.pry
            erb :'/users/account'
        else
            erb :'/sessions/login'
        end
    end

    get '/users/:id' do 
        @user = User.find(session[:user_id])
        if logged_in?
            erb :'/users/account'
        else    
            redirect to 'sessions/login'
        end
    end

    get '/users/:id/edit' do 
        if logged_in? 
            
            @user = User.find(session[:user_id])
            erb :"/users/edit"
        else    
            redirect to '/sessions/login'
        end
    end

    patch '/users/:id' do 
        @user = User.find(session[:user_id])
        #binding.pry 
        # if current_user.id === params[:id].to_i
        if !@user.authenticate(params[:password])
            flash[:message] = "Please type in your current password to make changes."
            redirect to "/users/#{@user.id}/edit"
        else
            @user.password = params[:password]
            if !params["new_password"].empty?
                if params["new_password"] == params["new_password2"]
                    #@user.update(password: params[:new_password])
                    @user.password = params[:new_password]
                    @user.save
                else 
                    flash[:message] = "New passwords do not match."
                    redirect "/users/#{@user.id}/edit"
                end
            end

                if params["email"] != user.email
                    user.email = params[:email]
                end
                if params["name"] != user.name
                    user.name = params[:name]
                    user.save
                    #binding.pry
                end
            #binding.pry
        flash[:message] = "User info successfully saved"
        redirect to "/users/account"
        end
    
    end



    delete "/users/:id" do 
        @user = User.find(session[:user_id])
        User.destroy(params[:id])
        session.clear
        redirect to "/"
    end
end