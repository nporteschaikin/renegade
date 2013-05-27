module Spaces
	module Relationship
		
		extend ActiveSupport::Concern
		
		included do
			has_many :space_entities, class_name: "Spaces::Entity", as: :entity, dependent: :destroy
			has_many :spaces, through: :space_entities 
		end
		
	end
end