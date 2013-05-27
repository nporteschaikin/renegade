class Space < ActiveRecord::Base
	
	include Users::Relationship
	
	has_and_belongs_to_many :rooms
	
	validates :slug, slug: true
	validates :name, presence: true

end
