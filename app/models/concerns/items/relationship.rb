module Items
	module Relationship
		extend ActiveSupport::Concern
		included do
			has_many :items, as: :item, class_name: "Item", dependent: :destroy
			accepts_nested_attributes_for :items
			validates :items, presence: true
		end
	end
end