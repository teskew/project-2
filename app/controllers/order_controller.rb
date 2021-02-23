class OrderController < ApplicationController
    # all routes pertaining to Post model 
     #crud
       # ERB tags: 
       # <%= %> = what our user sees
       # <% %> = what our views process
   
       # user just requested all posts 
       get '/orders' do 
        @orders = Post.all
        erb :'orders/index'
    end

       #Create
       get '/orders/new' do 
           erb :'/orders/new'
       end 
       
      
     post '/orders' do 
        @order = Order.create(
        name: params[:name], 
        address: params[:address],
        brewery_type: params[:brewery_type],
        phone: params[:phone]
        )
       redirect "/orders/#{@order.id}"
       
       end 

      #read      # user just made a request to view form to add a new order

      get '/orders/:id' do 
        # retrieve the requested post 
        @order = Order.find(params[:id])
        # show details of that post         
        erb :'orders/show'
    end 
      
   
 
    #    get '/posts/new' do 
    #        
    #    end 
   
    #    # user wants to see details of 1 post
    #    # show route
    #    get '/posts/:id' do 
    #        # retrieve the requested post 
    #       
    #        # show details of that post         
    #        erb :'posts/show'
    #    end 
   
    #    # our user just submitted the new post form 
    #    
   
    #    # our user just requested to see an edit form for a post
   
    #    get '/posts/:id/edit' do 
    #        # retreive the object
    #        # autofill a form with the details of that object
    #        # render to our user to fill out 
    #    end 
   
    #    # user just submitted the edit form
    #    patch '/posts/:id' do 
    #        # no view 
    #        # update the particular object with new attributes
    #    end 
   
    #    # user wants to delete an existing post 
    #    delete '/posts/:id' do 
    #        # no view 
    #    end 
   
   
   
   
   
   end 