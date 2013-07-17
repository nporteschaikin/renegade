class NotificationsController < ApplicationController
	
	# not done yet
	
	include EventStreaming
	
	def events
		response.stream.write "event: hello"
		super
	end
	
end