// gives up and down scroll buttons to images, spans, ... named up_name, down_name, respectively.
// will keep the default scroll_box's style overflow if it encounters errors (so make overflow: auto;)

// usage: put this after the scrollbox div:  var div_scroll1 = new TextScroll('div_scroll1', 'scroll_box');


var TextScroll = Class.create({
	initialize: function(scrollname, div_name, up_name, down_name) {
		    this.div_name = div_name;
		    this.name = scrollname;
		    this.scrollCursor = 0;
		    this.speed = 10;
		    this.timeoutID = 0;
		    this.div_obj = null;
		    this.up_name = up_name;
		    this.dn_name = down_name;
		    this.b_up = this.scrollUp.bindAsEventListener(this);
		    this.b_down = this.scrollDown.bindAsEventListener(this);
		    this.b_stop = this.stopScroll.bindAsEventListener(this);
		    if (document.getElementById) {
            	div_obj = $(div_name);
            	if (div_obj) {
	                this.div_obj = div_obj;
	                this.div_obj.setStyle({overflow: 'hidden'});
           		}
            Event.observe(up_name,'mousedown',this.b_up);
            Event.observe(up_name,'mouseup',this.b_stop);
			Event.observe(down_name,'mousedown',this.b_down);
            Event.observe(down_name,'mouseup',this.b_stop);
        }
    },

	stopScroll: function() {
	        clearTimeout(this.timeoutID);
	    },

	scrollUp: function() {
	        if (this.div_obj) {
	            this.scrollCursor = (this.scrollCursor - this.speed) < 0 ? 0 : this.scrollCursor - this.speed;
	            this.div_obj.scrollTop = this.scrollCursor;
	            this.timeoutID = setTimeout(this.name+'.scrollUp()', 60);
	        }
	    },

	scrollDown: function() {
	        if (this.div_obj) {
	            this.scrollCursor += this.speed;
	            this.div_obj.scrollTop = this.scrollCursor;
	            if (this.div_obj.scrollTop == this.scrollCursor) {
					this.timeoutID = setTimeout(this.name + '.scrollDown()', 60);
				} else {
					this.scrollCursor = this.div_obj.scrollTop;
				}
	        }
	    },

	resetScroll: function() {
	        if (this.div_obj) {
	            this.div_obj.scrollTop = 0;
	            this.scrollCursor = 0;
	        }
	    }
	});