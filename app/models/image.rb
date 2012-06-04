class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :sighting
  belongs_to :organism
  belongs_to :location
  
end
