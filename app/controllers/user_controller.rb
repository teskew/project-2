class UserController < ApplicationController

    # responsible for anything involving our Users

    get '/signup' do # render signup form
        erb :"users/signup"
    end 

    post '/signup' do # process the signup form
       
        # receive data from the form inside of params hash
        # create a new Users object with the data
       user = User.new(params)
#         # validate our Users object
#         # if Users.username != ""
      if user.username.blank? || user.email.blank? || user.name.blank? || user.password.blank? || User.find_by_email(params[:email]) || User.find_by_username(params[:username])
             redirect '/signup'
        else 
             user.save
            session[:users_id] = user.id # logging user in
             redirect '/orders'
        end 
         end 

    
#     # login '/login' read => querying our Users and reading users attributes

    get '/login' do # render the login form
        #binding.pry
        erb :"users/login"
     
    end 

    post '/login' do # process the login form
#         # gather data from the form => params
#         # find my Users object
         user = User.find_by_username(params[:username])
       # binding.pry
#         # if users exists && password is correct
        if user && user.authenticate(params[:password])
#             # login user
             session[:user_id] = user.id
#             # redirect 
            redirect '/orders'
        else
#              #flash[]
            flash[:error] = "Invalid login"
#             # invalid login
            redirect '/login'
        end 
     end 

    get '/logout' do
         session.clear
        redirect '/login'
    end 

#     # logout  'logout' delete => clears our session
 end 