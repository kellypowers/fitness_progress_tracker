class User < ActiveRecord::Base
    has_secure_password 
    has_many :forms
    validates_presence_of :name, :email, :password
  end