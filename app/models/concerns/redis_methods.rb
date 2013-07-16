module RedisMethods
	
	def rkey(key)
		"#{self.class.to_s}:#{self.id}:#{key}"
	end
	
	def sadd(key, value)
		$redis.sadd(self.rkey(key), value)
	end
	
	def srem(key, value)
		$redis.srem(self.rkey(key), value)
	end
	
	def smembers(key, value)
		$redis.smembers(self.rkey(key))
	end
	
end