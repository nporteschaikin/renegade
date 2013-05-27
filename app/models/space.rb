class Space < ActiveRecord::Base
	
	include Followable
	include Users::Relationship
	include Slug
	
	has_many :entities, class_name: "Spaces::Entity"
	has_many :items, through: :entities, source: :entity
	
	validates :name, presence: true

end
