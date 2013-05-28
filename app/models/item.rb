class Item < ActiveRecord::Base
	
	include Users::Relationship
	
  belongs_to :room
  belongs_to :item, polymorphic: true

	validates :item, presence: true
	validates :room, presence: true
		
end
