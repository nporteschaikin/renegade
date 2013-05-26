module Items
	module Links
		class Tweet < ActiveRecord::Base
			
			attr_accessor :response
			validates :tid, numericality: true
			has_attached_file :profile_image
			
			before_save do
				self.response = Twitter.status(self.tid)
				self.tweet = get_tweet
				self.name = get_name
				self.username = get_screen_name
				self.publish_date = get_publish_date
				self.profile_image = get_profile_image
			end
			
			private
			
				def get_tweet
					self.response.text
				end
				
				def get_name
					self.response.user.name
				end
				
				def get_screen_name
					self.response.user.screen_name
				end
				
				def get_publish_date
					self.response.created_at
				end
				
				def get_profile_image
					URI.parse(self.response.profile_image_url)
				end
			
		end
	end
end