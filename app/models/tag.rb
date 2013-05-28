class Tag < ActiveRecord::Base
	
	include Spaces::Relationship
	validates :tag, presence: true, length: { maximum: 18 }
	
end
