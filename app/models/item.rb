class Item < ActiveRecord::Base
	
	default_scope { includes(:item) }
	
  belongs_to :user
  belongs_to :room
  belongs_to :item, polymorphic: true

	validates :item, presence: true
	validates :user, presence: true
	validates :room, presence: true
		
end
