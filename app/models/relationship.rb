class Relationship < ActiveRecord::Base
	
	default_scope { includes(:followed) }
	
  belongs_to :user
  belongs_to :followed, polymorphic: true

end
