var contextPath = context;
var getPremiumApiLink = contextPath+'/ajax/easyhealth-insurance/getPremium';

$(document).ready(function() {
    $(".selection-inner .item").on("click", function() {
        changeSelection($(this).parents(".selection-inner").find(".selected"), false);
        changeSelection($(this), true);
        checkStepSelection();
    });

    $(".selection-inner .item").on("mouseenter mouseleave", function(e) {
        if ($(this).hasClass("selected")) {
            return;
        }
        var isOn = e.type == "mouseenter" ? true : false;
        changeSelection($(this), isOn, true);
    });


    $(".toggle-inner .item").click(function() {
        changeSelection($(this), !$(this).hasClass("selected"));
    });
    $(".toggle-inner .item").on("mouseenter mouseleave", function(e) {
        if ($(this).hasClass("selected")) {
            return;
        }
        var isOn = e.type == "mouseenter" ? true : false;
        changeSelection($(this), isOn, true);
    });



    var currYear = new Date().getFullYear();

    $('#dob').mobiscroll().date({
        dateOrder: 'ddMyy',
        dateFormat: 'dd-mm-yy',
        display: 'inline',
        showLabel: true,
        mode: 'scroller',
        layout: 'liquid',
        minWidth: 40
    });

    var mh = 0;

    alignChildHeight(".row-eq-height", "> [class^=col-]");



    $(".eh-btn-plan-overview").click(function() {
        var genderNum = $("#gender-opt .item.selected").attr("data-gender");
        var smokerNum = $("#smoker-opt .item.selected").attr("data-smoker");

        if ($(this).hasClass("disabled-gray-btn")) return;

        var selectDobAry = $('#dob').mobiscroll('getArrayVal');
        var dobStr = selectDobAry[2]+"-"+pad(selectDobAry[1], 2)+"-"+pad(selectDobAry[0], 2);
        $.post(getPremiumApiLink, { gender: genderNum, smoker: smokerNum, dob: dobStr }, function(data) {
            fillPlanData(data);
            //change step2 back btn img
            $(".step2 .btn-back-step1").attr("data-gender", genderNum);


            $(".step1").fadeOut(function() {
                $("html, body").animate({ scrollTop: 0 }, "slow");
                $(".step2").fadeIn();
            });
        }).fail(function() {
            alert("network error.");

        });
    });

    $(".eh-btn-tbl-detail").click(function() {
        $(".eh-plan-tab").hide();
        $(".btn-plan-selector[data-tab='" + $(this).data("tab") + "']:first").trigger("click");


        $(".step2").fadeOut(function() {
            $("html, body").animate({ scrollTop: 0 }, "slow");
            $(".step3, .sticky-help-wrapper").fadeIn(800, function() {
                stickerOffsetTop = $(".sticky-help-wrapper").offset().top;
                $(window).scroll();
            });

        });
    });

    $(".plan-selector-m .btn-show-more, .plan-selector-m .btn-plan-selector, .plan-selector-m .btn-plan-back").click(function() {
        $(".plan-selector-m .plan-selector-m-wrap").slideToggle(400, function() {
            $(this).parents(".plan-selector-m").find(".btn-show-more").toggleClass("show");
        });
    });


    $(".btn-plan-selector").on("click", function() {
        if ($(window).width() >= 992) startIntroAni($("." + $(this).data("tab")), 400); // default fadeIn speed 400ms

        // $(".plan-selector-m .plan-selector-m-wrap").slideToggle(400, function (){
        //     $(this).parents(".plan-selector-m").find(".btn-show-more").removeClass("show");
        // });

        $(".plan-selector-m .btn-show-more").css("opacity", 0);
        $(".plan-selector-m .btn-show-more .grid-head").html($(this).find(".grid-head").html());
        $(".plan-selector-m .btn-show-more .grid-desc").html($(this).find(".grid-desc").html());
        $(".plan-selector-m .btn-show-more").animate({
            opacity: 1
        }, "slow");

        $(".btn-plan-selector").removeClass("selected");
        $(".btn-plan-selector[data-tab=" + $(this).data("tab") + "]").addClass("selected");
        $(".eh-plan-tab").hide();
        $("." + $(this).data("tab")).fadeIn();
    });

    $(".btn-plan-back").click(function() {
        $(".step3").fadeOut(function() {
            $("html, body").animate({ scrollTop: 0 }, "slow");
            $(".step2").fadeIn();
        });
    });

    $(".sticky-help-wrapper").click(function() {
        $(this).fadeOut();

        $(".movingBgL").animate({
            width: "60%"
        }, 500);

        $(".movingBgR").animate({
            width: "60%"
        }, 500, function() {
            // Animation complete.
            $(".step3").fadeOut(100, function() {
                $("html, body").animate({ scrollTop: 0 }, "slow");
                $("body").scrollTo(".step-option");
                $(".step-option").fadeIn();
            });
            $(".movingBg").fadeOut(function() {
                $(".movingBg").css("width", 0).show();
            });
        });


    });

    $(".btn-option-select").click(function() {
        $("html, body").animate({ scrollTop: 0 }, "slow");
        $(".step-option").fadeOut(function() {
            $("body").scrollTo(".step3");
            $(".step3, .sticky-help-wrapper").fadeIn();
        });
    });
    $(".btn-back-step1").click(function() {
        $(".step2").fadeOut(function() {
            $("html, body").animate({ scrollTop: 0 }, "slow");
            $(".step1").fadeIn();
        });

        $(".step3 .eh-plan-a .slider-15yr-policy")[0].noUiSlider.destroy();
        $(".step3 .eh-plan-b .slider-15yr-policy")[0].noUiSlider.destroy();
        $(".step3 .eh-plan-c .slider-15yr-policy")[0].noUiSlider.destroy();
        $(".step3 .eh-plan-d .slider-15yr-policy")[0].noUiSlider.destroy();
    });

});

function changeSelection(item, selected, isAddSelected) {
    if (selected) {
        if (!isAddSelected) item.addClass("selected");
        var img = item.find("img");
        img.prop("src", img.prop("src").replace("_off.png", "_on.png"));
    } else {
        item.each(function() {
            if (!isAddSelected) item.removeClass("selected");
            var img = item.find("img");
            img.prop("src", img.prop("src").replace("_on.png", "_off.png"));
        });
    }
}

function alignChildHeight(sel, child) {
    max = 0;
    $(sel).find(child).each(function() {
        c_height = parseInt($(this).height());
        if (c_height > max) {
            max = c_height;
        }
    });
    $(sel).find(child).height(max);
}

$.fn.scrollTo = function(target, options, callback) {
    if (typeof options == 'function' && arguments.length == 2) {
        callback = options;
        options = target;
    }
    var settings = $.extend({
        scrollTarget: target,
        offsetTop: 50,
        duration: 500,
        easing: 'swing'
    }, options);
    return this.each(function() {
        var scrollPane = $(this);
        var scrollTarget = (typeof settings.scrollTarget == "number") ? settings.scrollTarget : $(settings.scrollTarget);
        var scrollY = (typeof scrollTarget == "number") ? scrollTarget : scrollTarget.offset().top + scrollPane.scrollTop() - parseInt(settings.offsetTop);
        scrollPane.animate({ scrollTop: scrollY }, parseInt(settings.duration), settings.easing, function() {
            if (typeof callback == 'function') { callback.call(this); }
        });
    });
}

function startIntroAni(tab$, delay, minWidth) {
    minWidth = minWidth || 768;
    if ($(document).width() < minWidth) return;

    var bldg$ = tab$.find(".img-building");
    var bed$ = tab$.find(".img-bed");
    var bg$ = tab$.find(".img-bg");

    var bCBorder$ = tab$.find(".img-big-border");
    var bCircle$ = tab$.find(".img-big-circle");
    var cid$ = tab$.find(".img-id");
    var cicu$ = tab$.find(".img-icu");
    var chc$ = tab$.find(".img-hc");
    var c15$ = tab$.find(".img-15");
    var cdb$ = tab$.find(".img-db");
    var cadb$ = tab$.find(".img-adb");

    //prepare
    bCBorder$.fadeTo(1, 0.001);
    [bldg$, bed$, bg$, bCircle$, cid$, cicu$, chc$, c15$, cdb$, cadb$].forEach(function(elem) {
        elem.hide();
    });

    //animation queue
    var qtarget$ = $("body");
    setTimeout(function() {
        qtarget$.queue("myq", function() {
            bed$.fadeIn(300, "easeInOutBack");
            bldg$.delay(300).fadeIn(600, "easeInOutBack", function() { qtarget$.dequeue("myq"); });
            bg$.delay(600).fadeIn(600, "easeInOutBack");
        });

        qtarget$.queue("myq", function() {
            bCircle$.show("scale", {}, 250);
            bCBorder$.delay(250).fadeTo(400, 1);

            var smallBall_ani_ms = 500;
            var smallBall_delay_ms = 150;

            chc$.delay(smallBall_delay_ms * 1).show("scale", { easing: 'easeInOutBack' }, smallBall_ani_ms);
            cid$.delay(smallBall_delay_ms * 2).show("scale", { easing: 'easeInOutBack' }, smallBall_ani_ms);
            cicu$.delay(smallBall_delay_ms * 3).show("scale", { easing: 'easeInOutBack' }, smallBall_ani_ms);
            c15$.delay(smallBall_delay_ms * 4).show("scale", { easing: 'easeInOutBack' }, smallBall_ani_ms);
            cadb$.delay(smallBall_delay_ms * 5).show("scale", { easing: 'easeInOutBack' }, smallBall_ani_ms);
            cdb$.delay(smallBall_delay_ms * 6).show("scale", { easing: 'easeInOutBack' }, smallBall_ani_ms);

            qtarget$.dequeue("myq");
        });

        qtarget$.dequeue("myq");

    }, delay + 250);
}

function showSuggestionModal() {
    $('#bought-modal').on('shown.bs.modal', function(e) {
        // do something...
        alignChildHeight("#bought-modal", " .txt-box");
    });
    $('#bought-modal').modal()
}

function checkStepSelection() {
    var totalSelectedOpt = $(".step1 .item.selected").length;

    if (totalSelectedOpt === 2) {
        $(".step1 .eh-btn-plan-overview").removeClass("disabled-gray-btn");
    }
}

function fillPlanData(json) {
    var planDetsils = json.plans;
    var planCode = ['a', 'b', 'c', 'd'];
    for (var pi = 0; pi < planDetsils.length; pi++) {
        var p = planDetsils[pi];
        var pc = planCode[pi];

        //plan overview
        $(".step2 .txt-type-" + pc).html(p.type);
        $(".step2 .plan-mca .txt-price-" + pc).html(priceFormat(p.monthly_amount));
        $(".step2 .plan-dhc .txt-price-" + pc).html(priceFormat(p.daily_hospital_cash));
        $(".step2 .plan-icu .txt-price-" + pc).html(priceFormat(p.intensive_care_unit));
        $(".step2 .plan-id .txt-price-" + pc).html(priceFormat(p.infectious_disease));
        $(".step2 .plan-rop .txt-price-" + pc).html(priceFormat(p.refund_premium));

        //plan selector
        $(".plan-selector-grid .btn-plan-selector[data-tab=eh-plan-" + pc + "] .grid-head").html(p.type);
        $(".plan-selector-grid .btn-plan-selector[data-tab=eh-plan-" + pc + "] .grid-desc .txt-price").html(priceFormat(p.monthly_amount));
        $(".plan-selector-m-wrap .btn-plan-selector[data-tab=eh-plan-" + pc + "] .grid-head").html(p.type);
        $(".plan-selector-m-wrap .btn-plan-selector[data-tab=eh-plan-" + pc + "] .grid-desc .txt-price").html(priceFormat(p.monthly_amount));

        //ferris wheel       
        $(".step3 .eh-plan-" + pc + " .txt-type").html(p.type);
        $(".step3 .eh-plan-" + pc + " .txt-youpay-price").html(priceFormat(p.monthly_amount));
        $(".step3 .eh-plan-" + pc + " .txt-price-hc").html(priceFormat(p.daily_hospital_cash));
        $(".step3 .eh-plan-" + pc + " .txt-price-icu").html(priceFormat(p.intensive_care_unit));
        $(".step3 .eh-plan-" + pc + " .txt-price-id").html(priceFormat(p.infectious_disease));
        $(".step3 .eh-plan-" + pc + " .txt-price-db").html(priceFormat(p.death_benefit));
        $(".step3 .eh-plan-" + pc + " .txt-price-adb").html(priceFormat(p.accidential_death_benefit));
        $(".step3 .eh-plan-" + pc + " .txt-price-rop").html(priceFormat(p.refund_premium));
        $(".step3 .eh-plan-" + pc + " .txt-price-yca").html(priceFormat(p.monthly_amount * 12));

        //benefit
        $(".step3 .eh-plan-" + pc + " .plan-benefit .txt-price-dhc").html(priceFormat(p.daily_hospital_cash));
        $(".step3 .eh-plan-" + pc + " .plan-benefit .txt-price-icu").html(priceFormat(p.intensive_care_unit));
        $(".step3 .eh-plan-" + pc + " .plan-benefit .txt-price-id").html(priceFormat(p.infectious_disease));
        var totlaUpTo = p.daily_hospital_cash + p.intensive_care_unit + p.infectious_disease;
        $(".step3 .eh-plan-" + pc + " .plan-benefit .txt-ttl-benefit-price").html(priceFormat(totlaUpTo));

        $(".step3 .eh-plan-" + pc + " .txt-price-y15").html(priceFormat(p.monthly_amount * 12 * 15));
        $(".step3 .eh-plan-" + pc + " .txt-price-y15_102").html(priceFormat(p.monthly_amount * 12 * 15 * 1.02));

        (function(section, mca) {
            var rangeSlider = $(".step3 .eh-plan-" + pc + " .slider-15yr-policy")[0];
            if(!rangeSlider) return;

            noUiSlider.create(rangeSlider, {
                start: [1],
                range: {
                    'min': [1],
                    'max': [16]
                },
                connect: 'lower',
                margin: 130
            });

            rangeSlider.noUiSlider.on('update', function( values, handle ) {
                var valueInt = Math.floor(values);

                var yearTxt = valueInt;

                if (yearTxt == 16) {
                    yearTxt = "15+";
                }

                $(".eh-plan-" + section + " .lblYear").html(yearTxt);

                var v = getTableData(valueInt, mca);
                $(".eh-plan-" + section + " .txt-ppr").html(v.ppr + "%");
                $(".eh-plan-" + section + " .txt-atpp").html(v.atpp.toFixed(2));
                $(".eh-plan-" + section + " .txt-ra").html(v.ra.toFixed(2));

            });

        })(pc, p.monthly_amount);
    }
}

var prpAry = [0, 0, 0, 0, 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 102];
function getTableData(year, mca) {
    var ppr = prpAry[year - 1];

    var maxContbYear = 10;

    var atpp = mca * (year > maxContbYear ? maxContbYear : year) * 12;

    var ra = 0;
    if (year > 5) {
        ra = atpp * (prpAry[year - 1] / 100);
    }

    return { "ppr": ppr, "atpp": atpp, "ra": ra };
}

function priceFormat(priceInt) {
    return "HK$" + numberWithCommas(priceInt);
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function pad(n, width, z) {
  z = z || '0';
  n = n + '';
  return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}