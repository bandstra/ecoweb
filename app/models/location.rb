class Location < ActiveRecord::Base
  has_many :sightings
  
end
