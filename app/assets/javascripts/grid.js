var grid = {
	
	init: function () {
		grid.bg();
	},
	
	bg: function () {
		_.$('grid:parent/grid:bg').each(
			function () {
				var bg = $(this).data('bg');
				$(this).css('background-image', 'url(' + bg + ')');
			}
		)
	}
	
}

$(document).on('construct', grid.init);