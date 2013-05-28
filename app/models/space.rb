class Space < ActiveRecord::Base
	
	#default_scope { includes(:entities => {:entity => [:items]}) }
	
	include Followable
	include Users::Relationship
	include Slug
	
	has_many :entities, class_name: "Spaces::Entity"
	has_many :users, through: :entities, source: :entity, source_type: "User"
	has_many :rooms, through: :entities, source: :entity, source_type: "Room"
	
	validates :name, presence: true
	
	def items
		Item.where("user_id IN(?) OR room_id IN(?)", users.collect(&:id), rooms.collect(&:id)).order("id DESC")
	end

end
