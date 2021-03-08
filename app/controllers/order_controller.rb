class OrderController < ApplicationController

  
    # requested all  order  
 
get '/orders' do 
 
    @orders = Order.all
  
  erb :'/orders/index'

 end 

#  # user just made a request to view form to add a new Order
   get '/orders/new' do 
      
      erb :'/orders/new'
    
      
      end
#  # user wants to see details of 1 Order
  
  get '/orders/:id' do 
   if get_order != nil
     erb :'/orders/show'
   else
    
    erb :"/error"
  end
end
  post '/orders' do

   @order = Order.new(params)
    @order.user_id = session[:user_id]
     # user=User.find(session[:user_id])
     @order.save
     redirect "/orders/#{@order.id}"
  end

   get '/orders/:id/edit' do 

    get_order
    redirect_if_not_authorized
    erb :"/orders/edit"
     
   end
  
   patch '/orders/:id' do
    
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
    # no view 
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