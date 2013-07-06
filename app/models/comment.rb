class Comment < ActiveRecord::Base
	
	include Users::Relationship
	attr_accessor :comments
	belongs_to :commented, polymorphic: true
	belongs_to :in_reply_to, class_name: "Comment"
	default_scope {order('created_at DESC')}
	
	validates :commented, presence: true
	
end
