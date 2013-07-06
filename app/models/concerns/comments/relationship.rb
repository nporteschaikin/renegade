module Comments
	module Relationship
		extend ActiveSupport::Concern
		included do
			has_many :comments, as: :commented
		end
	end
end