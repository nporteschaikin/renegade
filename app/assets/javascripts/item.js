var item = {
	
	create: function (html) {
		html = $(html);
		html.css({opacity: 0});
		_.$('items:parent').prepend(html);
		html.animate({opacity: 1});
	}
	
}