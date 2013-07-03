module Impressionable
	extend ActiveSupport::Concern
	included do
		
		has_many :impressions, as: :viewed
		
		def self.method_missing(m, *args, &block)
			if m =~ /(\w{1,})(_and_impress)\z/
				object = self.send m.to_s.match(/(\w{1,})(_and_impress)\z/).captures[0], *args.shift
				Impression.create viewed: object, ip: args.last.is_a?(String) ? args.last : args.last.remote_ip
				return object
			else
				super
			end
		end
		
	end
end