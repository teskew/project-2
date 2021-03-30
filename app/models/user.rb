#
 class User  < ActiveRecord::Base
  has_many :orders
  has_many :companies, through: :orders
  has_secure_password #adds to salt to our password 
  
 end