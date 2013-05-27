class Room < ActiveRecord::Base
	
	include Followable
	include Items::Relationship
	
	belongs_to :user
	
	validates :slug, format: { with: /^[a-z][-a-z0-9]*$/ }
	validates :name, presence: true

end
