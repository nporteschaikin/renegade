class Room < ActiveRecord::Base
	
	include Followable
	include Items::Relationship
	include Users::Relationship
	
	has_and_belongs_to_many :spaces
	
	validates :slug, slug: true
	validates :name, presence: true

end
