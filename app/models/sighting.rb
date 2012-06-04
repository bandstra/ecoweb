class Sighting < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  belongs_to :organism 
  has_many :comments

  def self.search(search)
    find(:all, :conditions => ['tag = ?', "#{search}"])
  end

  def self.import
    require 'csv'
    CSV.open('import/sightings.csv', 'r').each do |row|
      Sighting.create(:tag => row[0], :organism_id => row[1], :length => row[2], :weight => row[3], :parasite => row[4], :location_id => row[5], :date => row[6], :note => row[7], :user_id => row[8])
    end
  end

  def self.tags
    # find all records, then map fish tag attributes to an array to be used in a drop down menu
    find(:all, :select => "tag").map(&:tag).uniq
  end
end