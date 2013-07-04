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
		
		def self.popular(arguments)
			
			# set parent class
			visitors = Visitor.where(visited_type: self.name)
			
			# if location is set
			if arguments[:location]
				arguments[:distance] = 20 unless arguments[:distance]
				visitors = visitors.near(arguments[:location], arguments[:distance], order: false)
			end
			
			# if time is set
			if arguments[:time]
				return false unless arguments[:time].instance_of?(Fixnum) || arguments[:time].instance_of?(Float)
				visitors = visitors.where(created_at: arguments[:time].ago..Time.now)
			end
			
			# count and order
			count = visitors.count(group: :visited_id, order: "count_all DESC")
			
			if count.any?
				# get all ids
				ids = count.collect { |x| x.first }
				# if limit is set
				ids = ids.take(arguments[:limit]) if arguments[:limit]
				# return!
				self.where(id: ids).order("FIELD(id,#{ids.join(',')})")
			else
				return false
			end
			
		end
		
	end
end