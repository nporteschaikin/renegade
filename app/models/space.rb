class Space < ActiveRecord::Base
	
	include Users::Relationship
	
	has_many :entities, class_name: "Spaces::Entity"
	
	validates :slug, slug: true
	validates :name, presence: true

end
