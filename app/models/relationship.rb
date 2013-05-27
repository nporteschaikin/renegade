class Relationship < ActiveRecord::Base
	
	include Users::Relationship
	default_scope { includes(:followed) }
	
  belongs_to :followed, polymorphic: true

end
