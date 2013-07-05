class Item < ActiveRecord::Base
	
	include Users::Relationship
	include Tags::Relationship
	include Visible
	
	belongs_to :room
	belongs_to :object, polymorphic: true
	
	default_scope {includes(:object).order("id DESC")}
	
	validates :room, presence: true
	validates :message, length: { minimum: 1, maximum: 140 }

end
