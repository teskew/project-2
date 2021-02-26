class OrderController < ApplicationController

  
    # all routes pertaining to order model 
#creat   
     get '/orders/new' do 
             erb :'/orders/new'
        end 
        
    post '/orders' do
             @order = Order.create(
             name: params[:name],
             address: params[:address],
             brewery_type: params[:brewery_type],
             phone: params[:phone])
            redirect "/orders/#{order.id}" 
         end 
#    # read
    get '/orders/:id' do              
         # retrieve the requested post 
         @order = Order.find(params[:id])        
        erb :'/orders/show'
     end 
     
     get '/orders' do 
          @orders = Order.all
          erb :'orders/index'
     end 
   #update 
   get '/orders/:id/edit' do 
        @order = Order.find_by(id:params[:id])           
         
           erb :"/orders/edit"
     end 

     post '/orders/:id' do 
           @order = Order.find_by(id:params[:id])
           @order.update(
            name: params[:name],
            address: params[:address],
            brewery_type: params[:brewery_type],
            phone: params[:phone])
            redirect "/orders/#{order.id}" 
           
      end 

      

      

    
 #    get '/orders' do 

#                 #         @order = Order.find_by(id:params[:id])
#                 #            redirect_if_not_authorized
#                 #            @order.update(title: params[:title], content: params[:content])
#                 #            redirect "/orders/#{@post.id}" 
#                 #            # @post.update
#                 #            # no view 
#                 #            # update the particular object with new attributes
#      end 

 end



        



       
        

# #        #index route
# #        
   
#        # user just made a request to view form to add a new post
#        get '/orders/new' do 
#            erb :'orders/new'
#        end 
   
#        # show route
#        get '/orders/:id' do 



#         # @order = Order.find_by(id:params[:id])
#         #    erb :'orders/show'
#            # # retrieve the requested post 
#            # @post = Post.find(params[:id])
#            # # show details of that post         
#            # erb :'posts/show'
#        end 
   
#        # user wants to see details of 1 post
#        # show route
   
#        # our user just submitted the new post form 
       
   
#        # our user just requested to see an edit form for a post
   
#  
   
#        # user just submitted the edit form
#        patch '/orders/:id' do 
#         @order = Order.find_by(id:params[:id])
#            redirect_if_not_authorized
#            @order.update(title: params[:title], content: params[:content])
#            redirect "/orders/#{@post.id}" 
#            # @post.update
#            # no view 
#            # update the particular object with new attributes
#        end 
   
#        # user wants to delete an existing post 
#        delete '/orders/:id' do 
#         @order = Order.find_by(id:params[:id])
#            @order.destroy
#            redirect '/orders'
#            # no view 
#        end 
   
#    private 
   
#        def get_order
#            @order = Order.find_by(id:params[:id])
#        end 
   
#        def redirect_if_not_authorized
#            if @order.author != current_user
#                flash[:error] = "You cant make this edit, you don't own this"
#                redirect '/orders'
#            end 
   
#        end 
   
#    end 
#    # ERB tags: 
#    # <%= %> = what our user sees
#    # <% %> = what our views process

#    # user just requested all posts 
#    #index route
# #        get '/posts' do 
# #            @posts = Post.all
# #            erb :'posts/index'
# #        end 

# #        # user just made a request to view form to add a new post
# #        get '/posts/new' do 
# #            erb :'posts/new'
# #        end 

# #        # user wants to see details of 1 post
# #        # show route
# #        