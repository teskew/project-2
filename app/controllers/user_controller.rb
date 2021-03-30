class UserController < ApplicationController
#user can create, read, update and delete an order info
    
    get '/signup' do 
      if current_user
      # @orders = Order.all
      @orders = current_user.orders
       erb :'/orders/index'
     else
       erb :"/users/signup"
      end
    end 

    post '/signup' do # process the signup form, creates user.
          user = User.new(params)
       if params["username"].blank? || params["password"].blank? || params["name"].blank? || params["email"].blank?   
          flash[:error] = "THE INPUT IS BLANK"
          redirect :"/users/signup"  
          
    elsif  User.find_by_username(params[:username]) 
        
        flash[:error] = "YOUR ACCOUNT IS ON THE FILE PROCED TO LOGIN"
        redirect '/login'
      else 
             user.save
             session[:users_id] = user.id 
             redirect '/'
         end 
        end


    get '/login' do #render login form  
     if current_user
         #@orders = Order.all
         @orders = current_user.orders

         erb :'/orders/index'
     else
        erb :"/users/login"
     end
    end 

    post '/login' do #process login, post
        
         user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
             session[:user_id] = user.id
            redirect '/orders'
        else
            flash[:error] = "Invalid login pls signup if you are new"  # invalid login
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
 end 