module Followable
	extend ActiveSupport::Concern
	included do
		has_many :reverse_relationships, class_name: "Relationship", as: :followed
		has_many :followers, through: :reverse_relationships, source: :user
	end
end