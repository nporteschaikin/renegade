class Impression < ActiveRecord::Base
	
	belongs_to :viewed, polymorphic: true
	geocoded_by :ip
	after_validation :geocode
	
	validates :ip, presence: true
	validates :viewed, presence: true
	
	after_create do
		klass = self.viewed_type.constantize
		klass.increment_counter(:impressions_count, self.viewed_id)
		if self.viewed.impressions.where(ip: self.ip).count == 1
			klass.increment_counter(:uniques_count, self.viewed_id)
		end
	end
	
end