(function(window, undefined){
	
	window.Spine = window._ = {
		
		j: this.jQuery,
		
		timers: [],
		intervals: [],
		
		e: function (selector) {
			return element(selector);
		},
		
		c: function (selector) {
			return element(selector).substring(1);
		},
		
		$: function (selector) {
			return this.j(element(selector));
		},
		
		a: function (selector, value) {
			return attribute(selector, value);
		},
		
		once: function (method, timeout) {
			return this.timers.push(setTimeout(method, timeout));
		},
		
		every: function (time, name, method) {
			this.intervals[name] = {time: time, method: method};
			return this.start(name);
		},
		
		start: function (name) {
			return this.intervals[name]['interval'] = setInterval(this.intervals[name]['method'], this.intervals[name]['time']);
		},
		
		stop: function (name) {
			return clearInterval(this.intervals[name]['interval']);
		},
		
		unique: function (name) {
			if (typeof name != 'string') return false;
			return name + Math.ceil(Math.random()*1000);
		},
		
		dataAttr: function (attr, value) {
			return '[data-' + this.a(attr) + '="' + value + '"]';
		}
	
	};
	
	function element (selector) {
		
		var array = [];
		
		if (typeof selector === 'string') {
			
			selectors = selector.split('/');
			for (x in selectors) {
				selectors[x] = selectors[x].split(':');
				array.push(el[selectors[x][0]][selectors[x][1]]);
			}
			
			return array.join(' ');
			
		} else if (selector == window || selector == document) {
			return selector;
		}

		return false;
		
	}
	
	function attribute (selector, value) {

		var array = [];
		
		if (typeof selector === 'string') {
			selector = selector.split(':');
			if (typeof value != 'undefined') attr[selector[0]][selector[1]] = value;
			return attr[selector[0]][selector[1]];
		}
		
		return false;
		
	}

})(window);