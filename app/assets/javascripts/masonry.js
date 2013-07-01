var masonry = {
	
	init: function () {
		masonry.load();
		masonry.bind();
	},
	
	load: function () {
		_.$('masonry:container/masonry:images').imagesLoaded(
			function () {
				
				masonry.scroll();
				
				$(this).parents(_.e('masonry:container')).addClass(_.c('masonry:loaded'));
				var m = _.$('masonry:container').masonry({
					itemSelector: _.e('masonry:child'),
					gutter: 0,
					isFitWidth: true
				});
				
			}
		)
	},
	
	scroll: function () {
		
		var scroll = $('body').scrollTop();
		var win = $(window).height();
		
		_.$('masonry:container/masonry:child').each(
			function () {
				var th = $(this);
				var offset = th.offset().top;
				if (offset <= scroll + win) setTimeout(function () {th.addClass(_.c('masonry:loaded'))}, 125);
			}
		)
		
	},
	
	bind: function () {
		$(window).on('scroll', masonry.scroll);
		$(window).on('resize', masonry.scroll);
		$(window).on('resize', masonry.size);
	}
	
}

$(document).on('load', masonry.init);