module EventStreaming
	
	extend ActiveSupport::Concern
	include ActionController::Live
	
	included do
		before_filter :event_streaming_header, only: :events
	end
	
	def events
	rescue IOError
	ensure
		response.stream.close	
	end
	
	def event_streaming_header; response.headers['Content-Type'] = 'text/event-stream'; end
	
end