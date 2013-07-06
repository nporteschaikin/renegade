module Items
	class Composer
		
		attr_accessor :item, :room
		
		def initialize(room)
			self.room = room
			self.item = room.items.new
		end
		
		def link
			#self.item.item = Items::Link.new
			return self.item
		end
		
	end
end