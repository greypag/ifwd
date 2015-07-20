var zoomCtr = 4;
var currentRate = 3;
var isCurrentDefault = true;
$(function () {	
	showFWDChart(currentRate, zoomCtr, isCurrentDefault);
	
	$('#zero-rate').on('click', function() {
		$('.percent-buttons button').removeClass('active');
		$(this).addClass('active');
		currentRate = 0;
		changeCreditRate(currentRate, zoomCtr, isCurrentDefault);
	});
	
	$('#two-rate').on('click', function() {
		$('.percent-buttons button').removeClass('active');
		$(this).addClass('active');
		currentRate = 2;
		changeCreditRate(currentRate, zoomCtr, isCurrentDefault);
	});
	
	$('#three-rate').on('click', function() {
		$('.percent-buttons button').removeClass('active');
		$(this).addClass('active');
		currentRate = 3;
		changeCreditRate(currentRate, zoomCtr, isCurrentDefault);
	});
	
	$('#four-rate').on('click', function() {
		$('.percent-buttons button').removeClass('active');
		$(this).addClass('active');
		currentRate = 4;
		changeCreditRate(currentRate, zoomCtr, isCurrentDefault);
	});

	$(".investment-summary").swipe( {
		//Generic swipe handler for all directions
		swipeLeft:function(event, direction, distance, duration, fingerCount) {
			// zoom out
			if (zoomCtr < 4) {
				zoomCtr = zoomCtr + 1;
				showFWDChart(currentRate, zoomCtr, isCurrentDefault);
			}
		},
		swipeRight: function() {			
			// zoom in
			if (zoomCtr > 1) {
				zoomCtr = zoomCtr - 1;
				showFWDChart(currentRate, zoomCtr, isCurrentDefault);				
				$('.drag-more').fadeOut('fast');
			}
		},
		//Default is 75px, set to 0 for demo so any distance triggers swipe
		threshold:0
	});
});

function showFWDChart(rate, zoom, isDefault) {			
	var chartData = getSeries(rate, zoom, isDefault);
	var categories = getCategories(zoom, isDefault);
	var seriesData = chartData[0];
	var maxData = chartData[1];
	var tickIntervalData = chartData[2];
	var thirdYear = chartData[3];
	var threeYearsGuaranteed = getguaranteed3Years();
	var threeYearsGuaranteedtext = "100000";
	if (!isDefault) {
		threeYearsGuaranteedtext = threeYearsGuaranteed;
	}
	// get applicant's age
	var currentTime = new Date();
	var birthOfDay = Date.parse($('#birthOfDay').val());
	var applicantAge = Math.floor((currentTime - birthOfDay) / 1000 / 60 / 60 / 24 / 365);
	// get applicant's age 66 indicator
	var indicatorAge = 66;
	var indicatorPos = indicatorAge - applicantAge - 1;
	var contextPath = window.location.pathname.split("/")[1];
	$('#illustration-chart').highcharts({
		chart: {
			type: 'area',
			className: "fwd-chart",
			style: {"fontFamily":"\"Calibri\"", "fontSize": "14px", "color": "#b0bdbd"},
			events: {
				redraw: updateGuaranteedBubble,
			}
		},
		credits: {
			enabled: false,
		},
		title: {
			text: null,
			style: {"color": "#ffffff"}
		},
		xAxis: {
			categories: categories,
			labels: {
				align: "right",
				style: {"color": "#b0bdbd", "font-size": "14px", "width": "60px"},
				autoRotation: false,
				padding: 0,
				useHTML: true,
				formatter: function() {
					var text = this.value;
					if (text.length > 0) {
						return '<div class="x-axis-label">' + text + '</div>';
					} else {
						return '<div class="x-axis-no-label">' + text + '</div>';
					}
				}
			},					
			lineColor: "#e7ebeb",
			lineWidth: 2,
			tickLength: 0,
			plotLines: [{ // vertical line for 4th year
				color: "#ffc6a3",
				dashStyle: "ShortDash",
				value: 2,
				width: 1.5
			}, { // 100,000 year guaranteed
				id: "guaranteed",
				label: {
					text: "$"+threeYearsGuaranteedtext+" guaranteed<span class=\"guaranteed-tip guaranteed-tip-x\"></span>",
					align: "left",
					rotation: 0,
					verticalAlign: "top",
					y: 0,
					useHTML: true,
					style: {
						"color": "#ffffff",
						"background": "#ff8201",
						"padding": "16px 17px 9px 17px",
						"border-radius": "6px"
					}
				},
				value: 2,
				width: 1,
			}, { // age
				id: "age-no",
				label: {
					text: "<img src=\"/"+contextPath+"/resources/images/savie/age-icon.png\" class=\"img-responsive fwd-chart-age-img\"><span class=\"fwd-chart-age\">Age 66</span>",
					align: "center",
					rotation: 0,
					verticalAlign: "bottom",
					useHTML: true,
					y: 19
				},
				value: indicatorPos,
				width: 1,
			}]
		},
		yAxis: {
			plotLines: [{
				id: "guaranteed",
				label: {
					text: "$"+threeYearsGuaranteed+" guaranteed<span class=\"guaranteed-tip guaranteed-tip-y\"></span>",
					align: "left",
					rotation: 0,
					verticalAlign: "top",
					marginLeft: "-23px",
					y: 0,
					useHTML: true,
					style: {
						"color": "#ffffff",
						"background": "#ff8201",
						"padding": "16px 17px 9px 17px",
						"border-radius": "6px",
						
					}
				},
                value: threeYearsGuaranteed,
                width: 1,
            }],
			title: {
				text: null,
				rotation: 0,
				align: "high",
				margin: -60,
				style: {"width": "60px", "text-align": "left"},
				y: -30
			},
			labels: {
				style: {"color": "#b0bdbd", "font-size": "14px"},
				formatter: function() {
					return Math.ceil(this.value/1000);;
				}
			},
			gridLineColor: "#e7ebeb",
			gridLineWidth: 2,
			showFirstLabel: false,
			max: maxData,
			tickAmount: 4,
			tickInterval: tickIntervalData
		},
		legend: {
			enabled: false
		},
		plotOptions: {
			area: {
				marker: {
					enabled: false,
					symbol: 'circle',
					states: {
						hover: {
							enabled: false
						}
					}
				},
				pointPlacement: "on"
			}
		},
		tooltip: {
			enabled: false,
		},
		series: seriesData
	});
	
	updateGuaranteedBubble();
}

function updateGuaranteedBubble() {
	if ($('.guaranteed-tip-y').length > 0) {
		var $guaranteedY = $('.guaranteed-tip-y');
		$guaranteedY.parent().css({
			"margin-left" : "14px",
			"margin-top" : "-38px",
			"visibility": "hidden"
		});	
		var top = $guaranteedY.parent().css('top');
		top = top.replace('px','');
		top = parseInt(top) - 38;
		$('.guaranteed-tip-x').parent().css({
			"margin-left": '-23px',
			"top": top+'px'
		});
	}
}

function getSeries(rate, zoom, isDefault) {
	var series = new Array();
	var data = new Array();
	var max = 0;
	var benefitAxis = new Array();
	
	// get data
	if (zoom == 1) {
		data = getData(5, isDefault);
	} else if (zoom == 2) {
		data = getData(25, isDefault);
	} else if (zoom == 3) {
		data = getData(30, isDefault);
	} else if (zoom == 4) {
		data = getData(45, isDefault);
	}

	max = data[0][data[0].length-1];
	var tickInterval = Math.ceil(max / 3);
	
	var rates = [4, 3, 2, 0];
	for (var x = 0; x < 4; x++) {
		if (rates[x] == rate) {
			series.push({
				name: rates[x] + '%',
				lineColor: "#ff8200",
				lineWidth: 2,
				fillColor: "rgba(255, 130, 0, 0.2)",
				data: data[x]
			});
		} else {
			series.push({
				name: rates[x] + '%',
				lineColor: "#a3a3a3",
				lineWidth: 1,
				//fillOpacity: 0,
				fillColor: "rgba(255, 130, 0, 0)",
				data: data[x]
			});
		}
	}
	
	return new Array(series, max, tickInterval);
}

function changeCreditRate(rate, zoom, isDefault) {
	$('.fwd-chart .highcharts-series-group').animate({
		opacity: 0
	}, 500, function() {
		var seriesData = getSeries(rate, zoom, isDefault);
		var chart = $('#illustration-chart').highcharts();
		for(var x = 0; x < seriesData[0].length; x++) {
			chart.series[x].update(seriesData[0][x]);
		}
		$('.fwd-chart .highcharts-series-group').animate({
			opacity: 1
		}, 500);
	});
}

function getCategories(zoom, isDefault) {
	var categories;
	switch (zoom) {
		case 1:
			categories = ['1', '2', '3', '4', '5 Years'];
			break;
		case 2:
			categories = ['1','','','','5','','','','','10','','','','','15','','','','','20','','','','','25 Years'];
			break;
		case 3:
			categories = ['1','','','','','','','','','10','','','','','','','','','','20','','','','','','','','','','30 Years'];
			break;
		default:
			categories = ['1','','','','','','','','','','','','','','15','','','','','','','','','','','','','','','30','','','','','','','','','','','','','','','45 Years'];
			break;
	}
	
	return categories;
}

function getData(limit, isDefault) {
	if (isDefault) {
		var chart_data = new Array(
			[125000, 135000, 145000, 217000, 230000, 243000, 256000, 269000, 282000, 295000, 308000, 321000, 334000, 347000, 360000, 373000, 386000, 399000, 412000, 425000, 438000, 451000, 464000, 477000, 490000, 503000, 516000, 529000, 542000, 555000, 568000, 581000, 594000, 607000, 620000, 633000, 646000, 659000, 672000, 685000, 698000, 711000, 724000, 737000, 750000],
			[125000, 135000, 145000, 192000, 203000, 214000, 225000, 236000, 247000, 258000, 269000, 280000, 291000, 302000, 313000, 324000, 335000, 346000, 357000, 368000, 379000, 390000, 401000, 412000, 423000, 434000, 445000, 456000, 467000, 478000, 489000, 500000, 511000, 522000, 533000, 544000, 555000, 566000, 577000, 588000, 599000, 610000, 621000, 632000, 643000],
			[125000, 135000, 145000, 172000, 182000, 192000, 202000, 212000, 222000, 232000, 242000, 252000, 262000, 272000, 282000, 292000, 302000, 312000, 322000, 332000, 342000, 352000, 362000, 372000, 382000, 392000, 402000, 412000, 422000, 432000, 442000, 452000, 462000, 472000, 482000, 492000, 502000, 512000, 522000, 532000, 542000, 552000, 562000, 572000, 582000],
			[125000, 135000, 145000, 154000, 163000, 172000, 181000, 190000, 199000, 208000, 217000, 226000, 235000, 244000, 253000, 262000, 271000, 280000, 289000, 298000, 307000, 316000, 325000, 334000, 343000, 352000, 361000, 370000, 379000, 388000, 397000, 406000, 415000, 424000, 433000, 442000, 451000, 460000, 469000, 478000, 487000, 496000, 505000, 514000, 523000]
		);
	} else {
		var chart_data = items;
	}
	var d = new Array();
	for (var y = 0; y < 4; y++) {
		var dataPerRate = new Array();
		for(var x = 0; x < limit; x++) {
			dataPerRate.push(chart_data[y][x]);
		}
		
		d.push(dataPerRate);
	}
	
	return d;
}