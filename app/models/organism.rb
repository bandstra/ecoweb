class Organism < ActiveRecord::Base
  has_many :sightings
  belongs_to :group
  
  validates :common_name, :presence => true
  
end
