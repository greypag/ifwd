! function(t) {
    var e = {
            list: [],
            win: {
                h: window.innerHeight,
                w: window.innerWidth
            },
            isIE8: function() {
                return t("html").hasClass("ie8") ? !0 : !1
            },
            getWinSize: function() {
                document.body && document.body.offsetWidth && (this.win.w = document.body.offsetWidth, this.win.h = document.body.offsetHeight), "CSS1Compat" == document.compatMode && document.documentElement && document.documentElement.offsetWidth && (this.win.w = document.documentElement.offsetWidth, this.win.h = document.documentElement.offsetHeight), window.innerWidth && window.innerHeight && (this.win.w = window.innerWidth, this.win.h = window.innerHeight), n && (this.win.w = document.body.offsetWidth, this.win.h = document.body.offsetHeight)
            },
            init: function() {
                this.getMode(), e.updateMode(), t(window).resize(function() {
                    e.updateMode()
                })
            },
            m: "",
            register: function(e, n, i) {
                "" != e && 0 == t.grep(this.list, function(t) {
                    return t.selector == e && t.type == n ? (t.obj = i, t) : void 0
                }).length && this.list.push({
                    selector: e,
                    type: n,
                    obj: i
                })
            },
            unregister: function(n) {
                if ("" != n) {
                    var i;
                    t(e.list).each(function(t, e) {
                        e.selector == n && (i = t)
                    }), i > -1 && e.list.splice(i, 1)
                }
            },
            find: function(t) {
                if (value = !1, "" != t)
                    for (var e = 0; e < this.list.length; e++) {
                        var n = this.list[e];
                        n.selector == t && (value = e)
                    }
                return value
            },
            getMode: function() {
                return this.getWinSize(), this.win.w >= 1e3 || t("body").hasClass("nonresponsive") ? "desktop" : this.win.w >= 768 ? "tablet" : "mobile"
            },
            updateMode: function() {
                {
                    var e = this.getMode(),
                        n = t("body");
                    this.win.h
                }
                return n.css("padding-bottom", t("header").height() + t("footer").height()), e == this.m ? !1 : (n.removeClass(this.m).addClass(e), "mobile" != e ? (n.addClass("highres"), n.hasClass("t2") && t(".input-wrap").each(function() {
                    var e = t(this),
                        n = e.parents(".discount");
                    e.insertAfter(n.find(".content-box")), e.find(".title").insertBefore(n.find(".content-box ul"))
                }), t("footer .copyright-links").insertBefore(".corp-links")) : (n.removeClass("highres"), t(".title").each(function() {
                    {
                        var e = t(this),
                            n = e.parents(".discount");
                        t(".input-wrap")
                    }
                    e.insertAfter(n.find(".input-wrap .icon"))
                }), t(".input-wrap").each(function() {
                    var e = t(this),
                        n = e.parents(".discount");
                    e.appendTo(n.find(".image-wrap"))
                }), t("footer .copyright-links").appendTo("footer .full-width-container .container")), this.m = e, !0)
            },
            recalculate: function() {},
            resize: function() {}
        },
        n = function() {
            return navigator.userAgent.match(/(iPod|iPhone|iPad)/) ? !0 : !1
        },
        i = function() {
            var e = t("<input>");
            t("body").append(e), e.val(t("#wifi-voucher").val()).select(), document.execCommand("copy"), e.remove()
        };
    t("document").ready(function() {
        e.init();
        var o, s = t("body");
        if (s.hasClass("t2") && t(".more").click(function() {
                t(this).parents(".discount").toggleClass("expand")
            }), s.hasClass("t4")) {
            var d = t("input#wifi-voucher"),
                u = d[0];
            default_value = u.value, u.addEventListener("input", function() {
                this.value = default_value
            }, !1), t(".btn.copy").click(function(t) {
                t.preventDefault(), i(), n() && (document.getElementById("wifi-voucher").selectionStart = 0, document.getElementById("wifi-voucher").selectionEnd = 999, d.on("copy", function() {
                    clearTimeout(o), o = setTimeout(function() {
                        document.activeElement.blur()
                    }, 500)
                }))
            })
        }
    }), t(window).load(function() {
        e.init()
    })
}(jQuery);
! function($) {
    var validator = {
            required: function(e) {
                var t = /^\s*$/gi;
                return !t.test(e)
            },
            script: function(e) {
                var t = /<script[\s\S]*?>[\s\S]*?<\/script>/gi;
                return !t.test(e)
            },
            symbol: function(e) {
                var t = /[-!$%^&*()_+|~=`{}\[\]:";'<>?,.\/]/;
                return !t.test(e)
            },
            email: function(e) {
                var t = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))(\.|))+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i;
                return t.test(e)
            },
            username: function(e) {
                var t = /^[\.\-\_0-9a-zA-Z]{6,50}$/;
                return t.test(e)
            },
            phone: function(e) {
                var t = /^\d{8}$/;
                return t.test(e)
            },
            password: function(e) {
                var t = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
                return t.test(e)
            },
            confirm_password: function(e) {
                var t = $("#password").val(),
                    u = new RegExp("^" + t + "$", "gi");
                return u.test(e)
            },
            whitespace: function(e) {
                var t = /\s/g;
                return !t.test(e)
            },
            alphanumeric: function(e) {
                var t = /^\d|[a-zA-Z]$/;
                return !t.test(e)
            },
            checkbox: function() {
                return $("#agreement").prop("checked")
            }
        },
        digitInput = function(e) {
            var t = e || window.event,
                u = t.keyCode || t.which;
            u = String.fromCharCode(u);
            var r = /[0-9]|[\b]|[\t]|[+-]/;
            r.test(u) || (t.returnValue = !1, t.preventDefault && t.preventDefault())
        },
        emailInput = function(e) {
            var t = e || window.event,
                u = t.keyCode || t.which;
            u = String.fromCharCode(u);
            var r = /[a-zA-Z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}\[\]~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|@|[\b]|[\t]|\./;
            r.test(u) || (t.returnValue = !1, t.preventDefault && t.preventDefault())
        },
        flightNumberInput = function(e) {
            var t = e || window.event,
                u = t.keyCode || t.which;
            u = String.fromCharCode(u);
            var r = /[0-9]|[a-zA-Z]/;
            r.test(u) || (t.returnValue = !1, t.preventDefault && t.preventDefault())
        },
        usernameInput = function(e) {
            var t = e || window.event,
                u = t.keyCode || t.which;
            u = String.fromCharCode(u);
            var r = /[\.\-\_0-9a-zA-Z]/;
            r.test(u) || (t.returnValue = !1, t.preventDefault && t.preventDefault())
        },
        form = function() {
            function init() {
                $form = $("form"), $form.length >= 1 && $form.get(0).reset(), $fields = $form.find("input"), $error = $form.find(".error-message"), $submit = $form.find("#submit"), $("body").hasClass("t2") || $submit.removeClass("disabled"), $fields.blur(function() {
                    validate($(this))
                }), $("input[type=checkbox]").click(function() {
                    validate($(this))
                }), $("input[type=tel]").keypress(function() {
                    return $(this).val().length >= 8 ? !1 : void 0
                }), $("input").focus(function() {
                    $(this).parent().addClass("expand focus")
                }).blur(function() {
                    $(this).val().length < 1 ? $(this).parent().removeClass("expand focus") : $(this).parent().removeClass("focus")
                }), $("input[name=discount]").change(function() {
                    var e = $("input[name=discount]:checked").val();
                    void 0 != typeof e && null != e && $(".next").removeClass("disabled")
                }), $submit.click(submit)
            }

            function validate($fields) {
                var valid = !0;
                return validator ? ($fields.each(function(idx, ele) {
                    var $ele = $(ele);
                    if (hideError($ele), $ele.data("validate")) {
                        for (var val = $ele.val(), to_validate = $ele.data("validate").split(" "), l = to_validate.length, i = 0; l > i; i++) {
                            var result = !1;
                            switch (to_validate[i]) {
                                default: result = eval("validator." + to_validate[i] + "(val)")
                            }
                            if (!result) break
                        }
                        result ? hideError($ele) : (showError($ele), valid = !1)
                    }
                }), valid) : valid
            }

            function showError(e) {
                $fields.filter("[id='" + e.attr("id") + "']").parents("li").addClass("error").removeClass("ok")
            }

            function hideError(e) {
                $fields.filter("[id='" + e.attr("id") + "']").parents("li").removeClass("error").addClass("ok")
            }

            function submit() {
                $submit.hasClass("disabled") || (validate($fields) ? ($submit.addClass("disabled"), submitAction()) : animateScroll($(".error:eq(0)").offset().top, 100))
            }
            var $form, $submit, $fields, $labels, $submit;
            return {
                init: init
            }
        }();
    $("document").ready(function() {
        form.init();
        $("body");
        $("form input").keypress(function(e) {
            "tel" == $(this).attr("type") ? digitInput(e) : "email" == $(this).attr("type") ? emailInput(e) : "flight" == $(this).attr("name") ? flightNumberInput(e) : "username" == $(this).attr("name") && usernameInput(e)
        })
    }), $(window).bind("pageshow", function(e) {
        e.originalEvent.persisted && $("#submit").removeClass("disabled")
    })
}(jQuery);