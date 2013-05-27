class Room < ActiveRecord::Base
	
	include Followable
	include Items::Relationship
	
	belongs_to :user
	

end
