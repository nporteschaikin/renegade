class Item < ActiveRecord::Base
	
	include Users::Relationship
	include Tags::Relationship
	include Impressionable
	
	belongs_to :room
	belongs_to :item, polymorphic: true
	default_scope {includes(:item).order("id DESC")}
	
	validates :room, presence: true
	validates :message, length: { minimum: 1, maximum: 140 }
		
end
