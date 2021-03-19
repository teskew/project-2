require './config/environment'

# responsible for handling requests


class ApplicationController < Sinatra::Base
    
  configure do 
      # set sessions
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions 
      set :session_secret, "secret"
      register Sinatra::Flash
       set :show_exceptions, false
   end
    not_found do
    status 404
     erb :error
    end


     get "/" do 
    erb :welcome
  end
   error ActiveRecord::RecordNotFound do
    redirect  '/'
  end
  
  helpers do # makes these methods availble to controller and views
    
    # return the logged in user
   def current_user # return logged in user 
    @current_user ||= User.find_by_id(session[:user_id]) #memoization
   end
   
   def logout
      session.clear
   end


    # check if a user logged in
    def logged_in?
      !!session[:user_id]
    end 

  end 
     
 end
