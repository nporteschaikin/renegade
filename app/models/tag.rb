class Tag < ActiveRecord::Base
  
	belongs_to :tagged, polymorphic: true
	validates :tag, presence: true, uniqueness: { scope: :tagged }
  
end
