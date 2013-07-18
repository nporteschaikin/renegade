module Open
	
	include RedisMethods
	
	def open(object)
		self.sadd object.class.to_s.downcase.pluralize, object.id.to_s
	end
	
	def close(object)
		self.srem object.class.to_s.downcase.pluralize, object.id.to_s
	end
	
	def opened(name)
		name.to_s.classify.constantize.unscoped.where id: self.smembers(name.downcase)
	end
	
end