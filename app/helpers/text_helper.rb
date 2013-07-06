module TextHelper
	
	def tagged(string)
		raw(string.gsub(/(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/) { link_to("##{$1}", tag_path("#{$1}")) })
	end
	
end