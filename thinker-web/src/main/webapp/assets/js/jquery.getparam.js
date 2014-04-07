/*
	Author: Matt Bower <matt@webbower.com>
	Date: March 2011
*/
;(function($) {
	var
		_parseParams = function(url) {
			if(!url) return {};
			
			var
				_params = {},
				qStart = url.indexOf('?'),
				hStart = url.indexOf('#'),
				q = url.substr(qStart + 1),
				tmp,
				parts,
				i
			;

			if(hStart === -1) hStart = url.length;
			// q = qStart < hStart ? url.substring(qStart + 1, hStart) : url.substring(hStart, qStart);
			
			if(q) {
				tmp = q.split('&');
				i = tmp.length;
				while(i--) {
					parts = tmp[i].split('=');
					// _params[parts[0]] = decodeURIComponent(parts[1]).replace(/\+/g,' ');
					_params[parts[0]] = parts[1];
				}
			}
	
			return _params;
		}
	;
	
	$.getParam = function(key) {
		if(!key || $.type(key) !== 'string') return $._GET;
		
		return $._GET[key] ? $._GET[key] : null;
	};

	$.parseParams = function(url) {
		return _parseParams(url);
	};

	$.GET = $._GET = $.parseParams(location.href);
})(jQuery);