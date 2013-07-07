var parent = {
	
	add: function (element, html) {
		var obj = $(html);
		obj.hide();
		element.prepend(obj);
		obj.fadeIn(_.a('parent:speed'));
	}
	
}