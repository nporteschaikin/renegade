module Items
	module Relationship
		extend ActiveSupport::Concern
		included do
			attr_accessor :user, :room
			after_save do; Item.create!(item: self, user: self.user, room: Room.find(self.room)); end
		end
	end
end