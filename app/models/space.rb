class Space < ActiveRecord::Base
	
	include Followable
	include Impressionable
	include Users::Relationship
	include Slug
	
	has_many :entities, class_name: "Spaces::Entity"
	has_many :users, through: :entities, source: :entity, source_type: "User"
	has_many :rooms, through: :entities, source: :entity, source_type: "Room"
	has_many :tags, through: :entities, source: :entity, source_type: "Tag"
	
	validates :name, presence: true
	
	def items
		Item.where("user_id IN(?) OR room_id IN(?) OR id IN(?)", 
			users.collect(&:id), 
			rooms.collect(&:id),
			TagRelationship.where('tag_id IN (?) AND tagged_type  = ?', tags.collect(&:id), Item.name)
		).order("id DESC")
	end

end
