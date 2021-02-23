#class User < ActiveRecord::Base
   # has_many :orders
    #method that we get
    #user.post
    #user.post << shovel a new to brewer_co
    #user.post.buld(hash of attributes)
   # user.posts.creat(hash of attributes)
    #has many order through brewer_co
    #has many 
#endclass UsersController < ApplicationController

  # GET sign up form 
 class User  < ActiveRecord::Base
  has_many :orders
 end