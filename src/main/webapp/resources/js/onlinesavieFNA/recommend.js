var contextPath = context; //"/fwdhk"

var FNArecommendation = {
	api_show : contextPath+'/ajax/savings-insurance/show',
	api_update : contextPath+'/ajax/savings-insurance/update',
	api_product_recommend : contextPath+'/ajax/savings-insurance/product-recommend',
	api_enquiry : contextPath+'/ajax/savings-insurance/contactCs',
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


		$(".fna-btn-discover").click(function(e){
			e.preventDefault();
			$("body").scrollTo(".fna-product-gp-wrapper")
		})

		$(".fna-btn-show-detail").click(function(e){
			e.stopPropagation();
			if($(this).hasClass("isOpened")){
				$(this).parents(".fna-product-cont").find(".expander").slideUp();
				$(this).removeClass("isOpened");
			}else{
				$(this).parents(".fna-product-cont").find(".expander").slideDown();
				$(this).addClass("isOpened");
			}
			
		});

		$(".fna-btn-show-detail-row").click(function(e){
			$(this).find(".fna-btn-show-detail").trigger("click");
		});

		$(".fna-btn-expand-gp").click(function(e){
			e.stopPropagation();
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
		$(".fna-btn-expand-gp-row").click(function(e){
			$(this).find(".fna-btn-expand-gp").trigger("click");
		});

		$(".fna-btn-call-details").click(function(){

			var productCode = $(this).parents(".fna-product").data("productCode");
			
			

			$('#fnaPopupEnquiry').modal({
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

		$(".fna-btn-mob-cancel, .fna-btn-mob-close").click(function(){
			$(".fna-col-recommend").removeClass("fna-hide").addClass("fna-show");
			$(".fna-col-selection").removeClass("fna-show").addClass("fna-hide");
			that.parseUserData(that.fnaOriginalData);
		});

		$(".fna-btn-analyse, .fna-btn-mob-analyse").click(function(){
			//return if nothing selected
			if($(this).hasClass("disabled")) return;

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
				
				$(this).parents(".fna-sel-grid").find(".checkbox").hide();
				/*$(this).parents(".fna-sel-grid").find("input[type='checkbox']").not(":checked").each(function(){
					$(this).parent().hide();
				});*/
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
				   keyboard: false
			});
		});

		$(".fna-sel-grid input[type='checkbox']").change(function(){
			var q = $(this).parents(".fna-sel-grid").data();
			var vals = $("." + q.qName + " input:checkbox:checked").map(function(){
      			return $(this).val();
    		}).get().join(",");

    		$(this).parents(".fna-sel-grid").data("isEmpty",vals == "");
    			
			var isDifferent = q.originalVal != vals;

			if(isDifferent){
				that.fnaData[q.qName] = vals;
			}
			$(this).parents(".fna-sel-grid").data("isDifferent",isDifferent);

			//Check any question amended for the overlay display
			var filter = $(".fna-sel-grid").filter(function(){
				return $(this).data("isDifferent");
			});

			var anyEmpty =  $(".fna-sel-grid").filter(function(){
				return $(this).data("isEmpty");
			});

			var ttlEmpty = anyEmpty.length > 0;

			var ttlAmended = filter.length > 0;
			that.showHideAmendOverlayer(isDifferent || ttlAmended);
			
			if(isDifferent || ttlAmended){
				$(".fna-sel-floating-panel").fadeIn();
				$(".fna-sel-floating-panel").animate({"top":$(this).position().top},250);
			}else{
				$(".fna-sel-floating-panel").fadeOut();
			}

			if(ttlEmpty){
				$(".fna-btn-analyse, .fna-btn-mob-analyse").addClass("disabled");
			}else{
				$(".fna-btn-analyse, .fna-btn-mob-analyse").removeClass("disabled");
			}
    		

    		

			
		});

		$(".q4_b_amount input").keyup(function(){
			var q = $(this).data();
			var val = parseInt(this.value.replace(/\D/g, ''),10);
			console.log(val);
			if(isNaN(val) || val == 0){
				val = "";
			}
			
			var isDifferent = q.originalVal != val;
			this.value = String(val).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			//$(this).val(val);
			if(isDifferent){
				that.fnaData[q.qName] = val;
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

		$(".q4_b_amount input").blur(function(){
			$(this).trigger("keyup");
		})

		$(".fna-btn-clear").click(function(){
			$(".fna-popup-clear").modal({
			   keyboard: false
			});
		});
		
		$(".btn-clear-confirm").click(function(){
			$.ajax({     
			    url:contextPath+'/ajax/clearFna',     
			    type:'get',     
			    error:function(){       
			    },     
			    success:function(data){
			    	if(data != null && data.errMsgs == null){
			    		window.location = contextPath + "/" + language + "/FNA/financial-needs-analysis";
			    	}
			    }  
			});
		})

		$(".btn-clear-cancel").click(function(){
			$(".fna-popup-clear").modal("hide");
		})

		$("#fnaMobSort").change(function(){
			if(this.value != "") {
				if(this.value > 3){
					that.sortAsc = true;
					that.sortFld = parseInt(this.value,10) - 4;
				}else{
					that.sortAsc = false;
					that.sortFld = parseInt(this.value,10);
				}
				
				that.setLoading(true);
				
				that.loadProductRecommendSorting();
				/*
			setTimeout(function(){
				that.loadProductRecommend();
			},750);*/
			}
		});

		$(".fna-btn-cancel").click(function(){
			that.showHideAmendOverlayer(false);
			$(".fna-sel-floating-panel").fadeOut();
			that.parseUserData(that.fnaOriginalData);
		});


		var stickyTop = $(".fna-sel-cont").offset().top;
		
		$(window).scroll(function(){ // scroll event  
 
		var windowTop = $(window).scrollTop(); // returns number
			
			if (windowTop < $(".floating-marker").offset().top - $(window).height() + $(".fna-sel-title").offset().top) {
				$('.fna-btn-gp').css({ 'position': 'fixed'});
			}
			else {
				$('.fna-btn-gp').css('position','static');
			}

		});


		$(".fna-btn-submit").click(function(){
			
			if(that.validateCallForm()){

				var enquiryObj = {
					'product_code' : $("#productCode").val(),
					'channel' : $("#channel").val(),
					'customer_name' : $("#FNAinputCustomerName").val(),
					'email' : $("#FNAinputEmail").val(),
					'telephone' : $("#FNAinputMobileNo").val(),
					'preferred_date' : $("#preferred_date").val(),
					'preferred_time' : $("#preferred_time").val(),
					'enquiry_type' : $("#enquiry_type").val()

				};
				AjaxManager.fire(that.api_enquiry,enquiryObj,function(res){
					console.log(res);
					if(res.errMsgs == null){
						$('#fnaPopupEnquiry').modal('hide');
					}else if(res.status == 1){

					}else{
						//Session timeout
					}
					
				},null,"POST");
			}
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
		var fnaDatas = that.fnaData;
		fnaDatas.sort_by=sort_by;
		AjaxManager.fire(that.api_product_recommend,fnaDatas,function(res){
			that.fnaResultData = res;
			that.parseProductRecommend(res);
			that.setLoading(false);
		},null,"GET");
	},

	loadProductRecommend:function(morePage){
		var that = this;
		if(morePage != undefined) that.fnaPopupData = [];
		that.parseUserData(that.fnaData,true);
		var url = morePage ? morePage : that.api_product_recommend; 
		AjaxManager.fire(url,that.fnaData,function(res){
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

	parseUserData:function(data,reparse){
		//console.log(data);
		var that = this;
		var selection = ["q1","q2","q3","q4_a","q4_e"];

		var selectorPattern = ".{q} input[type='checkbox'][value='{v}']";
		$(selection).each(function(key,val){
			
			$("." + val).find("input[type='checkbox']").prop("checked",false);
			if(typeof(data[val]) == "number"){
				$(selectorPattern.replace("{q}",val).replace("{v}",data[val])).prop("checked",true);
			}else{
				/*var answer = data[val].split(",");

				$(answer).each(function(k2,v2){
					$(selectorPattern.replace("{q}",val).replace("{v}",v2)).prop("checked",true);
				});	*/
				if(data[val] != null) {
					var answer = data[val].split(",");
					$(answer).each(function(k2,v2){
						$(selectorPattern.replace("{q}",val).replace("{v}",v2)).prop("checked",true);
					});	
				}
			}

			$("."+ val).data({"originalVal":data[val],"qName":val,"isDifferent":false});
			
		});

		$(".q4_b_amount input").val(data.q4_b_amount);
		$(".q4_b_amount input").data({"originalVal":data.q4_b_amount,"qName":"q4_b_amount","isDifferent":false});

		/*$(".fna-sel-grid input[type='checkbox']:checked").each(function(){
			$(this).parent().show();
		});*/
		if(!reparse){
			$(".fna-sel-grid").each(function(){

				/*$(this).find("input[type='checkbox']").each(function(){
					if($(this).prop("checked")){
						$(this).parent().show();
					}else{
						$(this).parent().hide();
					}
				});	*/

				if($(this).find(".fna-btn-sel-expand").hasClass("glyphicon-minus")){
					$(this).find(".fna-btn-sel-expand").trigger("click");
				}
			});

			$(".txt_fna_name").text(data.name);
		}
		
		
		
	},
	parseProductRecommend:function(data,more){
		var that = this;
		var gpWrapper = $(".fna-product-gp-wrapper");
		var pNum = 0;
		if(!more) gpWrapper.empty();

		//Product Others
		var gpOthers = $(".fna-recommend .template .fna-product-gp").clone(true,true);
		gpOthers.find(".fna-product-gp-name").text("Unaffordable");
		gpOthers.find(".fna-product-gp-name").prepend($(".fna-recommend .template .result-type-ico").clone());
		var gpOthersWrapper = gpOthers.find(".fna-product-wrapper");
		gpOthersWrapper.append($(".template .fna-other-product-header").clone());

		if(data.product_list){

			for(var i = 0; i < data.product_list.length; i++){
				var gp_data = data.product_list[i];
				var gp = $(".fna-recommend .template .fna-product-gp").clone(true,true);
				if(that.sortFld > -1) gp.addClass("sort" + that.sortFld);
				gp.find(".fna-product-gp-name").text(gp_data.group);
				gp.find(".fna-product-gp-name").prepend($(".fna-recommend .template .result-type-ico").clone());

				var prodWrapper = gp.find(".fna-product-wrapper");
				
				//Product in Type
				
				//ILAS Handling
				if(gp_data.groupCode == "ILAS"){
					var prod = $(".fna-recommend .template .fna-other-product").clone();
					prod.append($("<p/>").text($(".template .txt_ilas").text()).addClass("desc-ilas"));
					prod.append($("<p/>").text($(".template .txt_ilas_only1").text()).addClass("desc-ilas-only1"));
					
					prodWrapper.append(prod);
				}

				if(gp_data.products){

					var animateList = [];
					for(var j = 0; j < gp_data.products.length; j++){
						pNum++;
						var prod_data = gp_data.products[j];

						
							var product_header = $(".fna-recommend .template .fna-product-lv-header").clone();

							
							var prod = $(".fna-recommend .template .fna-product").clone(true,true);

							prod.data("productCode",prod_data.product_code);

							if(prod_data.type){
								// var product_type = $(".fna-recommend .template .fna-product-type").clone(true,true);

								prod.find(".fna-product-type-name").text(prod_data.type);
								prod.find(".fna-product-type-tooltips").attr("data-original-title",prod_data.type_desc);
							}

							prod.find(".sort-header").before(product_header);

							prod.find(".product-mobile-display").text(prod_data.name);
							prod.find(".fna-product-name").text(prod_data.name);
							prod.find(".sort-header.withdata .con_prd").html(prod_data.contribution_period.join(", "));
							prod.find(".sort-header.withdata .min_age").text(prod_data.min_issue_age);
							prod.find(".sort-header.withdata .max_age").text(prod_data.max_issue_age);
							prod.find(".sort-header.withdata .prd_age").text(prod_data.protection_period);

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
								//prod.find(".fna-btn-sel-product").css("display","block");
								
							}else{
								prod.find(".fna-btn-details").hide();
								//prod.find(".fna-btn-call-details").css("display","block");
							}
							
							if(prod_data.product_code=='KSTS'){
								prod.find(".KSTS").css("display","block");
							}else if(prod_data.product_code=='KSTR') {
								prod.find(".KSTR").css("display","block");
							}else if(prod_data.product_code=='UTLS') {
								prod.find(".UTLS").css("display","block");
							}else{
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
						
						

						
						
						//prodWrapper.append(product_header);
						//prodWrapper.append(product_type);
						prodWrapper.append(prod);

						if(prod_data.show){

							animateList.push(prod);
						}
					}
				}

				if(gp_data.other_types){
					for(var j = 0; j < gp_data.other_types.length; j++){
						var other_data = gp_data.other_types[j];

						var other_product = $(".fna-recommend .template .fna-other-product").clone();
						other_product.find(".fna-product-type-name").text(other_data.type);
						other_product.find(".desc").html(other_data.type + " " + other_data.description);

						//prodWrapper.append(product_type);
						gpOthersWrapper.append(other_product);
					}
				}
				
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
		}
		
		if(data.next_page == null || data.next_page == ""){
			$(".fna-btn-load-products-more").hide();
		}else{
			$(".fna-btn-load-products-more").show();
		}

		if(pNum > 0){
			$(".txt_pnum").text(pNum);
			//Hide No Product description
			$(".noProducts").hide();
			//Show Recommendation Anchor and Sorting dropdown
			$(".haveProducts, .fna-sorting").show();
		}else{
			//Show No Product description
			$(".noProducts").show();
			//Hide Recommendation Anchor and Sorting dropdown
			$(".haveProducts, .fna-sorting").hide();
		}

		if(gpOthersWrapper.find(".fna-other-product").length > 0){
			gpWrapper.append(gpOthers);
		}
		

		//$('.fna-col-recommend .tool-tip').tooltip('destroy');
		$(".fna-product-gp-wrapper .fna-tooltips").tooltip();

		//Show Only 1 product description
		if(data.product_list.length == 1){
			FNArecommendation.showOnly1Product(true,data.q2,fnaq4e);
		}
		if(data.product_list.length>0 && data.hasILAS=='Y'){
			FNArecommendation.showILASsDescription(true);
		}
		if(data.product_list.length==0 && data.hasILAS=='Y'){
			FNArecommendation.showILASsDescriptionOnly1(true);
		}
		if(data.fulfilled=='N'){
			var rq1="";
			var fq1= fnaq1.split(",");
			var pq1= data.q1.split(",");
		    for (i=0;i<pq1.length ;i++ ){
		    	var r = true;
		    	for (j=0;j<fq1.length ;j++ ){
			    	if(fq1[j]==pq1[i]){
			    		r = false;
			    		break;
			    	}
			    }
		    	if(r){
		    		rq1 = rq1+pq1[i]+",";
		    	}
		    }
		    if(rq1!=null && rq1!=''){
		    	FNArecommendation.showNoAvailableProduct(true,data.q2,rq1.substring(0,rq1.length-1),fnaq4e);
		    }
		}
	},

	showNoAvailableProduct:function(display,products,objectives,year){
		//some logic in here...
		if(display){

			var cont = $(".template .txt_noAvailableProduct").text();
			var sep = $(".template .txt_sep").text() + " ";
			var products_str = "";
			var obj_str = "";

			var arr_p = products.split(",");
			var arr_p_str = [];
			$(arr_p).each(function(k,v){arr_p_str.push($(".template .txt_q2_" + v).text())});
			products_str = arr_p_str.join(sep);

			var arr_o = products.split(",");
			var arr_o_str = [];
			$(arr_o).each(function(k,v){arr_o_str.push($(".template .txt_obj_" + v).text())});
			obj_str = arr_o_str.join(sep);
			
			var year_str = $(".template .txt_q4e_" + year).text();

			cont = cont.replace("{products}",products_str).replace("{objectives}",obj_str).replace("{year}",year_str);

			$(".noAvailableProduct").show();
			$(".noAvailableProduct").text(cont);
			
			sendContSession("showNoAvailableProduct",cont);
		}else{
			$(".noAvailableProduct").hide();
		}
		
	},

	showOnly1Product:function(display,products,year){
		if(display){

			var cont = $(".template .txt_onlyOneProduct").text();
			var sep = $(".template .txt_sep").text() + " ";
			var products_str = "";

			var arr_p = products.split(",");
			var arr_p_str = [];
			$(arr_p).each(function(k,v){arr_p_str.push($(".template .txt_q2_" + v).text())});
			products_str = arr_p_str.join(sep);
			
			var year_str = $(".template .txt_q4e_" + year).text();

			cont = cont.replace("{products}",products_str).replace("{year}",year_str);

			$(".onlyOneProduct").show();
			$(".onlyOneProduct").text(cont);
			$(".hasManyProduct").hide();
			
			sendContSession("showOnly1Product",cont);
		}else{
			$(".onlyOneProduct").hide();
			$(".hasManyProduct").show();
		}
	},

	showILASsDescription:function(display){
		if(display){
			$(".desc-ilas").show();
			
			sendContSession("showILASsDescription",$(".desc-ilas").text());
		}else{
			$(".desc-ilas").hide();
		}
	},

	showILASsDescriptionOnly1:function(display){
		if(display){
			$(".desc-ilas-only1").show();
		}else{
			$(".desc-ilas-only1").hide();
		}
	},

	validateCallForm:function(){
		$(".fnaPopupEnquiry .text-red").text("");
		var result = true;
		var name = $.trim($("#FNAinputCustomerName").val());
		var email = $.trim($("#FNAinputEmail").val());
		var mobileno = $.trim($("#FNAinputMobileNo").val());
		if(name == ""){
			$("#errFNAinputCustomerName").text(getBundle(getBundleLanguage, "applicant.name.notNull.message"));
			result = false;
		}
		if(email == ""){
			$("#errFNAinputEmail").text(getBundle(getBundleLanguage, "form.email.empty"));
			result = false;
		}else if (!emailreg.test(email)){
			$("#errFNAinputEmail").text(getBundle(getBundleLanguage, "form.email.invalid"));
			result = false;
			
		}

		if(mobileno == ""){
			$("#errFNAinputMobileNo").text(getBundle(getBundleLanguage, "form.tel.empty"));
			result = false;
		}else if(!mobile_pattern.test(mobileno)){
			$("#errFNAinputMobileNo").text(getBundle(getBundleLanguage, "form.tel.invalid"));
			result = false;
		}

		return result;		
	}

};

$(document).ready(function(){
	FNArecommendation.init();	
});

$.fn.scrollTo = function( target, options, callback ){
  if(typeof options == 'function' && arguments.length == 2){ callback = options; options = target; }
  var settings = $.extend({
    scrollTarget  : target,
    offsetTop     : 50,
    duration      : 500,
    easing        : 'swing'
  }, options);
  return this.each(function(){
    var scrollPane = $(this);
    var scrollTarget = (typeof settings.scrollTarget == "number") ? settings.scrollTarget : $(settings.scrollTarget);
    var scrollY = (typeof scrollTarget == "number") ? scrollTarget : scrollTarget.offset().top + scrollPane.scrollTop() - parseInt(settings.offsetTop);
    scrollPane.animate({scrollTop : scrollY }, parseInt(settings.duration), settings.easing, function(){
      if (typeof callback == 'function') { callback.call(this); }
    });
  });
}

function goCustomerServices(){
	var name = $('#FNAinputCustomerName').val();
	var email = $('#FNAinputEmail').val();
	var mobile = $('#FNAinputMobileNo').val();
	var preferredDay = $('#preferred_date').val();
	var preferredTimeSlot = $('#preferred_time').val();
	var enquiryType = $('#enquiry_type').val();
	
	if(name ==null || name =="" || email ==null || email =="" || mobile ==null || mobile =="" || preferredDay ==null || preferredDay =="" || preferredTimeSlot ==null || preferredTimeSlot =="" || enquiryType ==null || enquiryType ==""){
		console.log("data error");
	}
	else{
		$.ajax({
		    url:contextPath+'/ajax/savings-insurance/contactCs',     
		    type:'get',
		    data:{    
    	    	"name" : name,
    	    	"email" : email,
    	    	"mobile" : mobile,
    	    	"preferredDay" : preferredDay,
    	    	"preferredTimeSlot" : preferredTimeSlot,
    	    	"enquiryType" : enquiryType
       		},
		    success:function(data){
		    	if(data != null && data.errorMsg == null){
		    		$('#fnaPopupEnquiry').modal('hide');
		    		$('#back-landing-modal').modal('show');
		    	}
		    },
       		error:function(){       
		    }
		});
	}
}

function sendContSession(key,value){
	$.ajax({     
	    url:contextPath+'/ajax/savings-insurance/sendContSession',
	    type:'get',
	    data:{    
	    	"key" : key,
	    	"value" : value
   		},
	    error:function(){       
	    },     
	    success:function(data){
	    }  
	});
}
