class Tag < ActiveRecord::Base
	
	include Spaces::Relationship
	include Visible
	
	validates :tag, presence: true, length: { maximum: 18 }, uniqueness: { case_sensitive: false }
	has_many :tag_relationships
	
end
