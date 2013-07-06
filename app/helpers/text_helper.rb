module TextHelper
	
	def tagged(string)
		raw(string.gsub(/(?:\s|^)(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/i) { link_to("##{$1}", tag_path("#{$1}")) })
	end
	
end