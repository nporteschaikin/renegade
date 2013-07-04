module Visible
	extend ActiveSupport::Concern
	included do
		
		has_many :visitors, as: :visited
		
		def self.method_missing(m, *args, &block)
			if m =~ /(\w{1,})(_and_visit)\z/
				object = self.send m.to_s.match(/(\w{1,})(_and_visit)\z/).captures[0], *args.shift
				Visitor.find_or_create_by!(visited: object, protocol: args.last.is_a?(String) ? args.last : args.last.remote_ip)
				return object
			else
				super
			end
		end
		
		def self.popular(time, limit = false)
			return false unless time.instance_of? Float
			ids = Visitor.where(visited_type: self.name, created_at: time.ago..Time.now).count(group: :visited_id, order: "count_all DESC").collect { |x| x.first }
			self.where(id: limit ? ids.take(limit) : ids).order("FIELD(id,#{ids.join(',')})")
		end
		
	end
end