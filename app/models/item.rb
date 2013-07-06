class Item < ActiveRecord::Base
	
	include Users::Relationship
	include Tags::Relationship
	include Comments::Relationship
	include Visible
	
	belongs_to :room
	belongs_to :item, polymorphic: true
	
	default_scope {includes(:item).order("id DESC")}
	
	validates :room, presence: true
	validates :message, length: { minimum: 1, maximum: 140 }
	validates_associated :item
	validates :item, uniqueness: { scope: :room }
	
	before_validation do; self.taggable = self.message; end

end
