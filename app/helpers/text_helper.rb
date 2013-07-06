module TextHelper
	
	def tagged(string)
		raw(string.gsub(/(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/) { link_to("##{$1}", tag_path("#{$1}")) })
	end
	
	def tweeted(string)
		raw(string.gsub(/(http\:\/\/[A-Za-z0-9\/\.\?\=\-]*)/,'<a target="_blank" href="\1">\1</a>')
			.gsub(/@(\w+)/, %Q{<a target="_blank" href="http://twitter.com/\\1">@\\1</a>}))
	end
	
end