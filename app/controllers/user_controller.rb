
class UserController < ApplicationController

  #  createresponsible for anything involving our user/
  #sign up are new
  #log in   read
  #log out delete
     get '/signup' do   #  signup form
        erb :"users/signup"
     end 

  # receive data from the form inside of params hash
  # create a new user object with the data


     post '/signup' do # process the signup form @@@@@@ useru
  
           user = User.new(params) # data validation  flash message
  # validate our user
  #if author.username != ""
#       else 
if user.username.blank? || user.email.blank? || user.name.blank? || user.password.blank?|| User.find_by_email(params[:email]) || User.find_by_username(params[:username]) 
          redirect '/signup'
      else 
            user.save
#            session[:user_id] = user.id # logging user in
           redirect '/posts'
        end 
   end 


# # login '/login' read => querying our author and reading authors attributes

#      get '/login' do # render the login form
#        erb :"users/login"
#      end 

#    post '/logn' do # process the login form
#   # gather data from the form => params
#   # find my author object
#   user = User.find_by_username(params[:username])
#   # binding.pry
#   # if author exists && password is correct
#      if user && userr.authenticate(params[:password])
#       # login user
#       session[:user_id] = user.id
#       # redirect 
#       redirect '/users'
#      else 
#       # flash[]
#       flash[:error] = "Invalid login"
#       # invalid login
#       redirect '/login'
#     end 
#    end 

#      get '/logout' do
#       session.clear
#        redirect '/login'
#     end 

# logout  'logout' delete => clears our session
end 