class OrderController < ApplicationController

  
    # requested all  order to display index
get '/orders' do          
   if @orders = current_user
      @orders = Order.all
      erb :'/orders/index'
   else
    flash[:error] = "pls login or signup"
    redirect '/'
  end
 end 

  # user just made a request to view form to add a new Order
   get '/orders/new' do 
      if @orders = current_user 
        erb :'/orders/new'
    else
      flash[:error] = "pls login or signup"
      redirect '/'
      end
    end
 # user wants to see details of 1 Order Show route
   
  get '/orders/:id' do 
   if get_order != nil
     erb :'/orders/show'
   else
    erb :"/error"
  end
end

  post '/orders' do #create new and save
   @order = Order.new(params)
    @order.user_id = session[:user_id]
     # user=User.find(session[:user_id])
     if params["name"].blank? || params["address"].blank? || params["brewery_type"].blank? || params["phone"].blank? 
         flash[:error] = "THE INPUT IS BLANK"
         redirect "/orders/new"
     else
        @order.save
        redirect "/orders/#{@order.id}"
  end
end

   get '/orders/:id/edit' do #update un excting order
      get_order
      redirect_if_not_authorized
      erb :"/orders/edit"
   end
  
   patch '/orders/:id' do #modify the update
      get_order
      redirect_if_not_authorized
      @order.update(name: params[:name], address: params[:address], brewery_type: params[:brewery_type], phone: params[:phone])
      redirect "/orders/#{@order.id}" 
  end

  delete '/orders/:id' do 
    get_order
    redirect_if_not_authorized
    @order.destroy
    redirect '/orders'
    end 
  


private 

def get_order
  @order = Order.find_by(id:params[:id]) 
end 

def redirect_if_not_authorized
    if @order.user != current_user
      flash[:error] = "You can't edit or delete pls go to new Account "
      redirect '/orders'
    end 
  end 
end    