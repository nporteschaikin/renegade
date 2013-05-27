class Tag < ActiveRecord::Base
  
	include Spaces::Relationship
	
	belongs_to :tagged, polymorphic: true
	validates :tag, presence: true, uniqueness: { scope: :tagged }
  
end
