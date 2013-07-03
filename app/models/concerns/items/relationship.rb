module Items
	module Relationship
		extend ActiveSupport::Concern
		included do
			attr_accessor :user, :room, :message
			after_save do
				puts self.message
				Item.create!(item: self, user: self.user, room: Room.find(self.room), message: self.message)
			end
		end
	end
end