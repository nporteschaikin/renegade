class TagRelationship < ActiveRecord::Base

	belongs_to :tag
	belongs_to :tagged, polymorphic: true

	validates :tag, presence: true, uniqueness: { scope: :tagged }

end
