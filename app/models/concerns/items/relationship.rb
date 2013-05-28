module Items
	module Relationship
		extend ActiveSupport::Concern
		included do
			has_one :item, as: :item, class_name: "Item", dependent: :destroy
			accepts_nested_attributes_for :item
			validates :item, presence: true
		end
	end
end