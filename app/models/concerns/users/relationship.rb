module Users
	module Relationship
		
		extend ActiveSupport::Concern
		
		included do
			belongs_to :user
			validates :user, presence: true
			default_scope { includes(:user) }
		end
		
	end
end