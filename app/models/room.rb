class Room < ActiveRecord::Base
	
	include Followable
	include Items::Relationship
	include Users::Relationship
	include Spaces::Relationship
	
	validates :slug, slug: true
	validates :name, presence: true

end
