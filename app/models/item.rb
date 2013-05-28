class Item < ActiveRecord::Base
	
	include Users::Relationship
	include Tags::Relationship
	
	belongs_to :room
	belongs_to :item, polymorphic: true
	
	validates :room, presence: true
		
end
