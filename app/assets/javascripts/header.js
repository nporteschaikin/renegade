var header = {
	
	close: function (id) {
		var object = _.$('header:parent')
			.find(_.e('header:object'))
			.filter(_.dataAttr('header:object', id));
		object.fadeOut(_.a('header:speed'),
			function () {
				$(this).remove();
			}
		)
	}
	
}