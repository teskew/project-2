# responsible for handling requests
# responding to those requests 

class ApplicationController < Sinatra::Base
    
  configure do 
      # set sessions
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions 
      set :session_secret, "secret"
  end
   
  get '/' do 
    
    "|-- Well Come To Breweries Co Info -----|" 
  end
     


 end
