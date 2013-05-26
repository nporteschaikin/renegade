class Room < ActiveRecord::Base
	
	include Items::Relationship
	
	belongs_to :user
	

end
