class Room < ActiveRecord::Base
	
	include Followable
	include Visible
	include Users::Relationship
	include Spaces::Relationship
	include Slug
	
	has_many :items, inverse_of: :room
	validates :name, presence: true
	
	def to_param; self.slug; end

end
