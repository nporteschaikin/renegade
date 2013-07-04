class Visitor < ActiveRecord::Base

	belongs_to :visited, polymorphic: true, counter_cache: true
	geocoded_by :protocol
	after_validation :geocode
	
	validates :visited, presence: true
	validates :protocol, format: { with: /([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}/ }
	
end
