class UserController < ApplicationController

    
    get '/signup' do # render signup form
        
        erb :"/users/signup"
        
    end 

    post '/signup' do # process the signup form
        user = User.new(params)
       
        # receive data from the form inside of params hash
        # create a new Users object with the data
       if params["username"].blank? || params["password"].blank? 
       
        flash[:error] = "THE INPUT IS BLANK"
        #  if  current _user == User.find_by_username(params[:username]) &&  password == User.authenticate(params[:password]) 
    

        redirect :"/users/signup"
        
    
        
    elsif  User.find_by_username(params[:username]) 
        
        flash[:error] = "YOUR ACCOUNT IS ON THE FILE PROCED TO LOGIN"
        #         # validate our Users object
        #         # if Users.username != 
        redirect '/login'
      else 

             user.save
             session[:users_id] = user.id 
             
             # logging user in
             redirect '/'
    
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
            flash[:error] = "Invalid login pls signup if you are new"
#             # invalid login
            redirect '/login'
        end 
     end 

     delete '/logout' do
        if session[:user_id] != nil
            session.distroy
            redirect '/'
        else
            redirect '/orders'
        end
    end


    get '/logout' do
        logout
        redirect '/'
    end 



#     # logout  'logout' delete => clears our session
 end 