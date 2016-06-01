var application = application || {};

application.signature = {
	elm: null,
	opts:{
		width:0,
		height:0,
		signatureFileSize:5000,
		customResize:false,
		events:{
			change:null,
			resize:null,
		}
	},
	init:function(_elm,_opts){

		if(!jQuery().jSignature){
			alert("Missing jSignature");
			return;
		}

		var that = this;

		$.extend(that.opts, _opts);
		that.elm = $(_elm);

		var _height = that.opts.height;
		var _width = that.opts.width;

		if(that.opts.useParentWidth){
			_width = $(_elm).parent().width();
			if(that.opts.ratio){
				_height = _width * that.opts.ratio;
			}
		}

		if(!that.opts.ratio){
			that.opts.ratio = _height/_width;
		}

		that.opts.ow  = that.opts.width  = _width;
		that.opts.oh  = that.opts.height  =_height;
		

		//Mobile/Desktop detection


		that.elm.jSignature({
			height: _height, 
			width: _width,
			lineWidth: 1,
			'decor-color': 'transparent',
			'signatureLine': false,
		});

		that.elm.on('change',function(e){
			if(that.opts.events.change != null) that.opts.events.change(e);
		});

		$(window).resize(function(){
			if(that.customResize){
				if(that.opts.events.resize) that.events.resize();
			}else{
				if(that.opts.useParentWidth){
					var _nw = that.elm.parent().width();
					var _nh = _nw * that.opts.ratio;

					console.log(_nw,_nh);

					if(_nw != that.opts.width){
						that.opts.width  = _nw;
						that.opts.height  =_nh;

						that.resizeSignature(_nw,_nh);
					}
				}
			}
		});
	},
	validate:function(){

		var that = this;
		var response = {error:-1,msg:"Unknown"};

		if(!that.elm.jSignature('getData','native').length){
			response.error = 1;
			response.msg = "Empty";
		}else{
			var datapair = that.elm.jSignature("getData","image");
			if(datapair[1].length > that.opts.signatureFileSize * 1024){
				response.error = 2;
				response.msg = "Over size";
			}else{
				response.error = 0;
				response.msg = "Success";
				response.data = datapair[1];
			}
		}

		return response;
	},
	resizeSignature:function(_width,_height){
		var that = this;
		var datapair = that.elm.jSignature("getData", "base30");
		that.elm.find('canvas.jSignature').prop({
			"height": _height,
			"width": _width,
			"lineWidth": 2
		}).css({
			"height":_height + 'px',
			"width": _width + 'px'
		});
		that.elm.jSignature("setData", "data:" + datapair.join(","));
	},
	clear:function(){
		var that = this;
		that.elm.jSignature('reset');
	}
};


