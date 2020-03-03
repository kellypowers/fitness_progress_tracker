require 'pry'
require 'rack-flash'
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
        end
    end

    get '/sessions/login' do
        # @user = User.find_by(:username => params[:username])
        # if user && user.authenticate(params[:password])
        #     session[:user_id] = user.id 
        #     redirect "/success"
        # else
        #     redirect "/failure"
        # end
        # # the line of code below render the view page in app/views/sessions/login.erb
        # erb :'sessions/login'
        if logged_in? 
            redirect to "/users/home"
        else
            erb :"/sessions/login"
        end
    end

    post '/sessions' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
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

        @user = User.find(session[:user_id])
        #binding.pry
        erb :'/users/home'
    end

    get '/users/account' do
        @user = User.find(session[:user_id])
        binding.pry
        erb :'/users/account'
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
        user = User.find(session[:user_id])
        #binding.pry 
        # if current_user.id === params[:id].to_i
        if !user.authenticate(params[:password])
            flash[:message] = "Please type in your current password to make changes."
            redirect to "/users/#{user.id}/edit"
        else
            user.password = params[:password]
            if !params["new_password"].empty?
                if params["new_password"] == params["new_password2"]
                    #@user.update(password: params[:new_password])
                    user.password = params[:new_password]
                    user.save
                else 
                    flash[:message] = "New passwords do not match."
                    #redirect "/users/#{@user.id}/edit"
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



    # get "/success" do
    #     if logged_in?
    #         erb :'/users/home'
    #     else
    #         flash[:message] = "Invalid email/password. Please try again."
    #         redirect "/login"
    #     end
    # end

    delete "/users/:id" do 
        @user = User.find(session[:user_id])
        User.destroy(params[:id])
        session.clear
        redirect to "/"
    end
end