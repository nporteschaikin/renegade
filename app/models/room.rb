class Room < ActiveRecord::Base
	
	include Followable
	include Users::Relationship
	include Spaces::Relationship
	include Slug
	
	has_many :items
	
	validates :name, presence: true
	
	def to_param; self.slug; end

end
