require "./config/environment"
require "./app/models/user"

class ApplicationController < Sinatra::Base
    #register Sinatra::ActiveRecordExtension 
    configure do
      set :views, "app/views"
      enable :sessions
      set :session_secret, "secret"
      set :views, Proc.new { File.join(root, "../views/") }
    end
  
    get '/' do
      if logged_in?
        redirect to "/users/home"
      else
        erb :home
      end
    end
  
    def current_user 
      @current_user ||= User.find_by_id(session[:user_id])
    end
  
    helpers do
      def logged_in?
        !!current_user
      end
  
      # def current_user
      #   User.find(session[:user_id])
      # end
    end
  end