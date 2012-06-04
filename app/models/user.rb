class User < ActiveRecord::Base
  
  attr_accessible :firstname, :lastname, :avatar, :email, :password, :password_confirmation
  
  has_secure_password
  
  has_many :comments
  has_many :sightings
  has_one  :role  
  
  validates :email, :presence => true, :uniqueness => true,
            :format => /(\S+)@(\S+)\.(\S+)/
  validates :password, :presence => true,
            :confirmation => true,
            :length => { :minimum => 6, :maximum => 255 },
            :on => :create
  validates :avatar, :presence => true, :uniqueness => true
          
  
 
end
