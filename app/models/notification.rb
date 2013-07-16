class Notification
	
	class << self
		
		def all(user)
			
			# get from redis
			notifications = self.select(user)
			
			# parse all values
			parsed = notifications.map{|n| JSON.parse(n)}
			
			# eager load users
			users = User.where(id: parsed.map{|u| u.first}.uniq);
			
			# eager load objects
			objects = []
			object_map = parsed.map{|o| [o.second, o.third]}.uniq
			object_map.uniq{|o| o.first}.each do |o|
				objects << o.first.constantize.unscoped.where(id: object_map.select{|i| i.first == o.first}.map{|i| i.last}.uniq)
			end
			
			# make objects array one-dimensional
			objects = objects.flatten
			
			# create array of instances
			array = []
			notifications.each_with_index do |n,i|
				array << self.new(n, actor: users.select{|u| u.id == parsed.fetch(i).first}, object: objects.select{|o| o.class.to_s == parsed.fetch(i).second && o.id == parsed.fetch(i).third})
			end
			
			# return array
			array
			
		end
		
		def select(user); $redis.smembers self.key(user); end
		def key(user); "notify:#{user.id}"; end

		def create(to, from, object, action)
			$redis.sadd self.key(to), [from.id, object.class.to_s, object.id, action, Time.now].to_json
		end
		
	end
	
	def initialize(value, args = nil)
		@value = value.is_a?(Array) ? value : JSON.parse(value)
		if args
			@actor = args[:actor]
			@object = args[:object]
		end
	end
	
	def actor
		@actor || User.unscoped.find(@value.first)
	end
	
	def object
		@object || @value.second.constantize.unscoped.find(@value.third)
	end
	
	def action
		@value.fourth
	end
	
	def created
		@value.fifth
	end
	
end