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
    get_order
     erb :'/orders/show'
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
      flash[:error] = "You cant make this edit/delete, you don't own this"
      redirect '/orders'
  end 

end 

end    