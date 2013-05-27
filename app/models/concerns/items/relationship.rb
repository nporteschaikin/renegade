module Items
	module Relationship
		extend ActiveSupport::Concern
		include Tags::Relationship
		included do
			has_many :items, as: :item, class_name: "Item", dependent: :destroy
		end
	end
end