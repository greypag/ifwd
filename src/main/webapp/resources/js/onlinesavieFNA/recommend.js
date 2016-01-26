var contextPath = context; //"/fwdhk"

var FNArecommendation = {
	api_show : contextPath+'/ajax/savie-online/show',
	api_update : contextPath+'/ajax/savie-online/update',
	api_product_recommend : contextPath+'/ajax/savie-online/product-recommend',
	fnaOriginalData : null,
	fnaData : null,
	fnaResultData : null,
	fnaPopupData:[],
	sortFld:-1,
	sortAsc:true,
	fnaDataAmended:false,
	init : function(){
		/*$('#fnaPopupEnquiry').modal({
		   backdrop: 'static',
		   keyboard: false
		});*/
		var that = this;
		that.setLoading(true);

		$(".fna-btn-show-detail").click(function(){
			if($(this).hasClass("isOpened")){
				$(this).parents(".fna-product-cont").find(".expander").slideUp();
				$(this).removeClass("isOpened");
			}else{
				$(this).parents(".fna-product-cont").find(".expander").slideDown();
				$(this).addClass("isOpened");
			}
			
		});

		$(".fna-btn-expand-gp").click(function(){
			if($(this).hasClass("isOpened")){
				$(this).parents(".fna-product-gp").find("> .expander").slideUp();
				
				$(this).removeClass("isOpened glyphicon-minus");
				$(this).addClass("glyphicon-plus");
			}else{
				$(this).parents(".fna-product-gp").find("> .expander").slideDown();
				$(this).removeClass("glyphicon-plus");
				$(this).addClass("isOpened glyphicon-minus");
			}
		});

		$(".fna-btn-call-details").click(function(){
			$('#fnaPopupEnquiry').modal({
			   backdrop: 'static',
			   keyboard: false
			});
		})

		$(".fna-link-key-exclusions").click(function(){
			var popup = $(".fna-popup-keys");
			popup.find("h4").text($(this).text());

			var html = that.fnaPopupData[$(this).data("key")].key_exclusions;
			popup.find(".d-cont").html(html);
			popup.modal('show');
		});

		$(".fna-link-key-risk").click(function(){
			var popup = $(".fna-popup-keys");
			popup.find("h4").text($(this).text());

			var html = that.fnaPopupData[$(this).data("key")].key_product_risks;
			popup.find(".d-cont").html(html);
			popup.modal('show');
		});

		$(".fna-btn-filter").click(function(){
			$(".fna-col-recommend").removeClass("fna-show").addClass("fna-hide");
			$(".fna-col-selection").removeClass("fna-hide").addClass("fna-show");
		});

		$(".fna-btn-mob-cancel").click(function(){
			$(".fna-col-recommend").removeClass("fna-hide").addClass("fna-show");
			$(".fna-col-selection").removeClass("fna-show").addClass("fna-hide");
		});

		$(".fna-btn-analyse, .fna-btn-mob-analyse").click(function(){
			$(".fna-product-gp-wrapper").empty();
			$("html, body").stop().animate({scrollTop:0});
			//affact in Mobile only
			$(".fna-col-recommend").removeClass("fna-hide").addClass("fna-show");
			$(".fna-col-selection").removeClass("fna-show").addClass("fna-hide");

			that.showHideAmendOverlayer(false);
			$(".fna-sel-floating-panel").fadeOut();
			that.setLoading(true);
			that.sortFld = -1;
			that.sortAsc = true;

			$(".fna-col-recommend > .sort-header > div, .fna-col-recommend > .sort-header .fa").removeClass("selected");

			that.saveAndLoad();

			/*
			setTimeout(function(){
				that.saveAndLoad();
			},750);*/
		});

		$(".fna-sel-grid .fna-btn-sel-expand").click(function(){

			if($(this).hasClass("glyphicon-plus")){
				$(this).parents(".fna-sel-grid").find("input[type='checkbox']").removeAttr("disabled");

				$(this).parents(".fna-sel-grid").find(".checkbox").show();
				$(this).removeClass("glyphicon-plus").addClass("glyphicon-minus");

				$(this).parents(".fna-sel-grid").find("input[type='text']").removeAttr("readonly").addClass("editable");
				$(this).parents(".fna-sel-grid").addClass("editing");
			}else{
				

				$(this).parents(".fna-sel-grid").find("input[type='checkbox']").not(":checked").each(function(){
					$(this).parent().hide();
				});
				$(this).parents(".fna-sel-grid").find("input[type='checkbox']").attr("disabled",true);
				$(this).removeClass("glyphicon-minus").addClass("glyphicon-plus");

				$(this).parents(".fna-sel-grid").find("input[type='text']").attr("readonly",true).removeClass("editable");
				$(this).parents(".fna-sel-grid").removeClass("editing");
			}
			
		});

		$(".fna-btn-feature-more").click(function(){
			if($(this).prev().is("ul")){
				$(this).removeClass("show");
				var lis = $(this).prev().find("li:hidden"), i = 0;
				(function() {$(lis[i++] || []).slideToggle(500/ lis.length ,arguments.callee)})();

			}
		});

		$(".fna-btn-load-products-more").click(function(){
			$(this).removeClass("show");

			that.setLoading(true);
			that.loadProductRecommend(that.fnaResultData.next_page);

		});

		$(".fna-sel-grid .radio-gp input[type='checkbox']").change(function(){
			$(this).parents(".radio-gp").find("input[type='checkbox']").removeAttr("checked");
			$(this).prop("checked",true);

			//if($(this).parents(".fna-sel-grid").data("originalVal") = )
		});

		$(".fna-btn-sel-product").click(function(e){
			//e.preventDefault();
			$("#loading-overlay-save").find(".fna-select-product-link").attr("href",$(this).attr("href"));

			$('#loading-overlay-save').modal({
				   backdrop: 'static',
				   keyboard: false
			});
		});

		$(".fna-sel-grid input[type='checkbox']").change(function(){
			var q = $(this).parents(".fna-sel-grid").data();
			var vals = $("." + q.qName + " input:checkbox:checked").map(function(){
      			return $(this).val();
    		}).get();

			var isDifferent = q.originalVal != vals;

			if(isDifferent){
				that.fnaData[q.qName] = vals;
			}
			$(this).parents(".fna-sel-grid").data("isDifferent",isDifferent);

			//Check any question amended for the overlay display
			var filter = $(".fna-sel-grid").filter(function(){
				return $(this).data("isDifferent");
			});

			var ttlAmended = filter.length > 0;
			that.showHideAmendOverlayer(isDifferent || ttlAmended);
			
			if(isDifferent || ttlAmended){
				
				$(".fna-sel-floating-panel").animate({"top":$(this).position().top},250);
				$(".fna-sel-floating-panel").fadeIn();
			}else{
				$(".fna-sel-floating-panel").fadeOut();
			}
		});

		//Sorting Button
		$(".fna-col-recommend > .sort-header > div").click(function(){

			if($(this).find(".sort-arrow-gp").length > 0){
				
				that.setLoading(true);

				if(!$(this).hasClass("selected")){
					that.sortFld = parseInt($(this).data("sortFld"),10);
					$(this).parent().find(">div").removeClass("selected");
					$(this).parent().find(".sort-arrow-gp .fa").removeClass("selected");
					$(this).addClass("selected");
				}else{
					//Swap Order Asc/Desc
					that.sortAsc = !that.sortAsc;
				}

				$(this).find(".sort-arrow-gp .fa").removeClass("selected");

				if(that.sortAsc){
					$(this).find(".sort-arrow-gp .fa-caret-up").addClass("selected");
				}else{
					$(this).find(".sort-arrow-gp .fa-caret-down").addClass("selected");
				}

				that.loadProductRecommendSorting();

				/*setTimeout(function(){
					that.loadProductRecommend();
				},750);*/
			}

		});

		$("#fnaMobSort").change(function(){
			if(this.value > 3){
				that.sortAsc = false;
				that.sortFld = parseInt(this.value,10) - 4;
			}else{
				that.sortAsc = true;
				that.sortFld = parseInt(this.value,10);
			}
			
			that.setLoading(true);

			that.loadProductRecommendSorting();
/*
			setTimeout(function(){
				that.loadProductRecommend();
			},750);*/
		});

		$(".fna-btn-cancel").click(function(){
			that.showHideAmendOverlayer(false);
			$(".fna-sel-floating-panel").fadeOut();
			that.parseUserData(that.fnaOriginalData);
		});

		
		that.initLoad();

		//Btn Analyse
	},

	initLoad:function(){

		var that = this;
		//url, postData, successCallBack, _timeout, _method
		AjaxManager.fire(that.api_show,null,function(res){
			that.fnaData = res;
			that.fnaOriginalData = $.extend(true, {}, res);
			that.parseUserData(res);
			//Assign Value to 

			AjaxManager.fire(that.api_product_recommend,that.fnaData,function(res){
				that.fnaResultData = res;
				that.parseProductRecommend(res);
				that.setLoading(false);
			},null,"GET");
		},null,"GET");
	},

	saveAndLoad:function(){
		var that = this;
		AjaxManager.fire(that.api_update,that.fnaData,function(res){
			that.loadProductRecommend();
		},null,"POST");
	},

	loadProductRecommendSorting:function(){
		var that = this;
		var sort_by = that.sortFld + (that.sortAsc ? 0 : 4);
		AjaxManager.fire(that.api_product_recommend,{sort_by:sort_by},function(res){
			that.fnaResultData = res;
			that.parseProductRecommend(res);
			that.setLoading(false);
		},null,"GET");
	},

	loadProductRecommend:function(morePage){
		var that = this;
		if(morePage != undefined) that.fnaPopupData = [];
		var url = morePage ? morePage : that.api_product_recommend; 
		AjaxManager.fire(url,null,function(res){
			that.fnaResultData = res;
			that.parseProductRecommend(res, morePage != undefined);
			that.setLoading(false);
		},null,"GET");
	},

	setLoading:function(flag){
		if(flag){
			$('#loading-overlay').modal({
				   backdrop: 'static',
				   keyboard: false
			});
		}else{
			$('#loading-overlay').modal('hide');
		}
	},

	showHideAmendOverlayer:function(flag){
		if(flag){
			$(".amended-overlayer").stop().animate({"width":"100%"},250);
		}else{
			$(".amended-overlayer").stop().animate({"width":0},250);
		}
		isAmendOverlayerShown = flag;
	},

	parseUserData:function(data){
		var that = this;
		var selection = ["q1","q2","q3","q4_a","q4_e"];

		var selectorPattern = ".{q} input[type='checkbox'][value='{v}']";
		$(selection).each(function(key,val){
			
			$("." + val).find("input[type='checkbox']").prop("checked",false);
			if(typeof(data[val]) == "number"){
				$(selectorPattern.replace("{q}",val).replace("{v}",data[val])).prop("checked",true);
			}else{
				if(data[val]!=null){
					var answer = data[val].split(",");
				}

				$(answer).each(function(k2,v2){
					$(selectorPattern.replace("{q}",val).replace("{v}",v2)).prop("checked",true);
				});	
			}

			$("."+ val).data({"originalVal":data[val],"qName":val,"isDifferent":false});
			
		});

		$(".q4_b_amount input").val(data.q4_b_amount);

		/*$(".fna-sel-grid input[type='checkbox']:checked").each(function(){
			$(this).parent().show();
		});*/

		$(".fna-sel-grid:not(.editing)").each(function(){
			$(this).find("input[type='checkbox']").each(function(){
				if($(this).prop("checked")){
					$(this).parent().show();
				}else{
					$(this).parent().hide();
				}
			});			
		})


	},
	parseProductRecommend:function(data,more){
		var that = this;
		var gpWrapper = $(".fna-product-gp-wrapper");
		if(!more) gpWrapper.empty();
		for(var i = 0; i < data.product_list.length; i++){
			var gp_data = data.product_list[i];
			var gp = $(".fna-recommend .template .fna-product-gp").clone(true,true);
			if(that.sortFld > -1) gp.addClass("sort" + that.sortFld);
			gp.find(".fna-product-type").text(gp_data.type);
			gp.find(".fna-product-type-tooltips").attr("data-original-title",gp_data.type_desc);

			var prodWrapper = gp.find(".fna-product-wrapper");
			
			//Product in Type

			if(gp_data.products){

				var animateList = [];
				for(var j = 0; j < gp_data.products.length; j++){

					var product_header = $(".fna-recommend .template .fna-product-lv-header").clone();

					var prod_data = gp_data.products[j];
					var prod = $(".fna-recommend .template .fna-product").clone(true,true);

					prod.find(".sort-header .product").text(prod_data.name);
					prod.find(".sort-header .con_prd").html(prod_data.contribution_period.join(", "));
					prod.find(".sort-header .min_age").text(prod_data.min_issue_age);
					prod.find(".sort-header .max_age").text(prod_data.max_issue_age);
					prod.find(".sort-header .prd_age").text(prod_data.protection_period);

					var key_feature_ul = $("<ul/>");

					$(prod_data.features).each(function(key,val){
						var li = $("<li/>");
						li.text(val);
						key_feature_ul.append(li);
					});
					//Show More Button if larger than 3
					if(key_feature_ul.find("li").length > 3){
						key_feature_ul.find("li:gt(2)").hide();
						prod.find(".fna-btn-feature-more").addClass("show");
					}
					prod.find(".fna-product-feature-cont").prepend(key_feature_ul);					

					var objective_ul = $("<ul/>");
					$(prod_data.objectives).each(function(key,val){
						var icon = $(".fna-recommend .template .fna-ico-tick").clone();
						var li = $("<li/>");
						li.text(val);

						li.prepend(icon);

						objective_ul.append(li);
						
					})
					prod.find(".fna-product-obj-cont").append(objective_ul);

					if(prod_data.product_url){
						prod.find(".fna-btn-details").attr("href",prod_data.product_url)
						prod.find(".fna-btn-sel-product").css("display","block");
						
					}else{
						prod.find(".fna-btn-details").hide();
						prod.find(".fna-btn-call-details").css("display","block");
					}

					if(prod_data.brochure_url){
						prod.find(".fna-btn-download").attr("href",prod_data.brochure_url)
					}else{
						prod.find(".fna-btn-download").hide();
					}

					var popupObj = {
						key_exclusions:prod_data.key_exclusions,
						key_product_risks:prod_data.key_product_risks
					};
					
					that.fnaPopupData.push(popupObj);

					if(prod_data.key_exclusions == ""){
						prod.find(".fna-link-key-exclusions").addClass("hide");
					}else{
						prod.find(".fna-link-key-exclusions").data("key",that.fnaPopupData.length - 1);
					}
					if(prod_data.key_product_risks == ""){
						prod.find(".fna-link-key-risk").addClass("hide");
					}else{
						prod.find(".fna-link-key-risk").data("key",that.fnaPopupData.length - 1);
					}
					if(prod.find(".fna-link-key-exclusions").hasClass("hide") && prod.find(".fna-link-key-risk").hasClass("hide")){
						prod.find(".fna-product-link-keys").hide();
					}

					if(prod_data.next_page != null || prod_data.next_page != ""){
						$(".fna-btn-load-products-more").show();
					}else{
						$(".fna-btn-load-products-more").hide();
					}
					
					prodWrapper.append(product_header);
					prodWrapper.append(prod);

					if(prod_data.show){

						animateList.push(prod);
					}
				}
			}
			// console.log(gp.find(".fna-product-type-tooltips").("originalTitle"));
			gpWrapper.append(gp);

			
				if(i < 2) $(gp).find(".fna-btn-expand-gp").trigger("click");

				if(animateList.length > 0){
					$(animateList).each(function(){
						var that = this;
						setTimeout(function(){
							that.find(".fna-btn-show-detail").trigger("click");
						},750)
						
					})
				}
			

		}
		//$('.fna-col-recommend .tool-tip').tooltip('destroy');
		$(".fna-product-gp-wrapper .fna-tooltips").tooltip();
	}

};

$(document).ready(function(){
	FNArecommendation.init();	
});