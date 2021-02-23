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

  # define general routes
  # any route/request that doesnt involve a model 
  
 # get '/' do 
    # binding.pry
    
  # erb :welcome

  end
  






  



  #   def get_post do
  #     @post = Post.find_by(id:params[:id])

  #   end 
  # end

  

  # about route
  # contact page

