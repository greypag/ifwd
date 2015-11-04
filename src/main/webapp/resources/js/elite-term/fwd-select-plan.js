   //var language = "en";
   var stickyHeight = 130;
   var planDetailData = {};
   var appInfoData = {};
   var empEduInfoData = {};
   var beneInfoData = {};
   var underwritingSummData = {};
   var currentSection = 'et-select-plan-section';
   var getBundleLanguage = "";
   var lang = languageP;

   if(lang === "EN"){
   	getBundleLanguage = "en";
   }else 
   if(lang === "tc"){
   	getBundleLanguage = "zh";
   } 
   else{
   	getBundleLanguage = "en";
   }
   
// get resource bundle
   function getBundle(lang, key) {
   	var rtn; 
   	loadBundles(lang, key, function(value){
   		rtn = value;
   	});
   	return rtn;
   }
   function loadBundles(lang, key, fn) {
   	//var u = window.location.origin+''+home+'/resources/bundle/';
      	$.i18n.properties({
           name: 'Messages',
           path: ''+home_url+'/resources/bundle/',
           mode: 'map',
           language: lang,
           cache: true,
           callback: function() {
           	fn($.i18n.prop(key)); //msg_welcome;	//$.i18n.prop("msg_welcome")      
           }
       });
   }
   
   // REDIRECT TO SPECIFIC SECTION
   var _selectedSection = window.location.hash;
   if (_selectedSection && (_selectedSection === '#application')) {
      $('#et-btn-before-start').removeClass('et-pad-bot-50');
      $('#et-about-yoursel-section').removeClass('hide-element');
      $('#et-btn-ay-self').removeClass('et-pad-bot-50');
      $('#et-plan-option-section').removeClass('hide-element');
      var $_appInfo = $('#et-application-first-section').removeClass('hide-element')
                        .css('margin-bottom', '190px');
      
      $('body, html').animate({
         scrollTop: ($_appInfo.offset().top - stickyHeight) + 'px'
      }, 500);
   }
   // END OF REDIRECT TO SPECIFIC SECTION
   
   
   // Update date to 18 years before current date
   var _date = new Date();
   var _newdate = new Date(_date);
   _newdate.setYear(_newdate.getYear() - 18);
   var sixty = new Date(_date);
   sixty.setYear(sixty.getYear() - 60);
   sixty.setDate(sixty.getDate()+1);
   
   var $planDate = $('#et-select-plan-date-input').datepicker({
      format: "dd-mm-yyyy",
      container: "#date",
      autoclose: true,
      startView: "decade",
      endDate: _newdate,
      startDate: sixty
   }).datepicker('setDate', new Date(_newdate)).val('DD-MM-YYYY');
   $planDate.on('changeDate', function(e) {
      $('#sales-illu-dob').val(this.value);
   });
   
   var $infoDOB = $('#sales-illu-dob').datepicker('remove');    
   if ((msieversion() > 0) && (msieversion() < 10)) {
      $infoDOB.css('font-family', 'Arial');
   }
   
   // Bind event to Gender
   $('#et-gender-male, #et-gender-female').on('change', function(e){
      if (this.checked) {
         document.getElementById('savieApplicantBean.gender').value = (this.value === 'M') ? 'Male' : 'Female';
      } else {
         document.getElementById('savieApplicantBean.gender').value = '';
      }
   });
   
   // Override the default value color
   $('select.gray-dropdown', '#et-application-info-section')
      .css('color', '#C4C3C3')
      .on('change', function(e) {
         var $self = $(this);
         
         $self.removeAttr('style');
      }); 
   $('#et-select-plan-date-input')
      .css('color', '#9ba5a7')
      .on('change', function(e) {
         var $self = $(this);
         
         $self.removeAttr('style');
         $self.css('color', '#000');
         if(msieversion() > 0) {
            $('#et-select-plan-date-input').css('font-family','Arial');
         }
      }); 
   
   // Show disctric dropdown if selected country is Hong Kong
   $(document).on('change', '.et-app-info-country', function(e) {
      var $self = $(this);
         
      if ($self.val() === 'Hong Kong') {
         $self.closest('.selectDiv')
                  .siblings('.et-district-wrapper')
                  .removeClass('hide-element');
      } else {
         $self.closest('.selectDiv')
                  .siblings('.et-district-wrapper')
                  .addClass('hide-element')
                  .find('select')
                  .css('color', '#9ba5a7')
                  .find('option')
                  .first()
                  .attr('selected', 'selected');
                  
      }
   });   
   
   // Active appropriate nav items
   $(window).scroll(function(e) {
      var $self = $(this);
      var $stickyNav = $('.et-bind-btn-header');
      
      if (currentSection === 'et-application-first-section') {
         $stickyNav.removeClass('active')
                              .eq(1)
                              .addClass('active');
         $('#et-active-section-label').text($stickyNav.eq(1).text());
         
         return;
      }
      
      if ($self.scrollTop() > 2100) {
         // Update sticky menu navigator
         $stickyNav.removeClass('active')
                              .eq(1)
                              .addClass('active');
         $('#et-active-section-label').text($stickyNav.eq(1).text());
      } else {
         $stickyNav.removeClass('active')
                              .first()
                              .addClass('active');
         $('#et-active-section-label').text($stickyNav.first().text());
      }
   });
   
   $('#et-btn-change-date').on('click', function(e) {
      $('body, html').animate({
         scrollTop: ($('#et-about-yoursel-section').offset().top - stickyHeight) + 'px'
      }, 500);
   });
   
   
   //PLAN OPTION PROMO CODE HIDE TOGGLE
   $(document).on('click', '#promocode-hide-switch', function(e) {
      if($("#promocode-hidden").hasClass('hidden-xs')) {
         $("#promocode-hidden").removeClass('hidden-xs hidden-sm');
         $(this).find('img').removeClass('reversed');
         $(this).removeClass('et-mbot-15');
      }
      else {
         $("#promocode-hidden").addClass('hidden-xs hidden-sm');
         $(this).find('img').addClass('reversed');
         $(this).addClass('et-mbot-15');
      }         
   });
   
   // Medical declaration collapse event
   $('.et-collapse').on('show.bs.collapse', function(e) {
      var $target = $(e.currentTarget);
      var $prevTarget = $target.data('prev-target');
      
      if ($prevTarget) {
         $prevTarget = $('#' + $prevTarget);
         
         if ($prevTarget.attr('data-is-answered') !== 'true') {
            e.preventDefault();
         }
      } 
   });
   
   // Medical declaration button yes event
   $(document).on('click', '.et-btn-medic-yes', function(e) {
      e.preventDefault();
      
      var $self = $(this);
      var $collapseSec = $self.closest('.et-collapse');
      var nextTarget = $self.data('next-target');
      
      $collapseSec.attr('data-is-answered', true);
      
      $self.addClass('btn-selected');
      
      $collapseSec.find('.et-btn-medic-no')
                  .removeClass('btn-selected');
   });
   
   // Medical declaration button no event
   $(document).on('click', '.et-btn-medic-no', function(e) {
      e.preventDefault();
      
      var $self = $(this);
      var $collapseSec = $self.closest('.et-collapse');
      var nextTarget = $self.data('next-target');
      
      $collapseSec.attr('data-is-answered', true);
      
      $self.addClass('btn-selected');
      
      $collapseSec.find('.et-btn-medic-yes')
                  .removeClass('btn-selected');
      
      // Show the next button 
      // if all questions are answered with no
      if (isMedicAnsweredWithNo()) {
         $('#et-medical-dec-next').removeClass('hide-element');
      }
      
      // Expand next question
      if (nextTarget) {
         setTimeout(function() {
            $('a[href="#' + nextTarget + '"]').trigger('click');
         }, 50);
      }
   });
   
   // Login submit event
   $('#et-login-form').on('submit', function(e) {
      e.preventDefault();
      
      // Modify the code here for 
      // the login implementation
      $('#loginModal').modal('hide');
      
      var $appInfo = $('#et-application-first-section');
      $appInfo.removeClass('hide-element')
               .css('margin-bottom', '190px');
      
      // Update current section flag
      $('#' + currentSection).addClass('hide-element');
      currentSection = 'et-application-first-section';
      
      $('body, html').animate({
         scrollTop: ($appInfo.offset().top - stickyHeight) + 'px'
      }, 500);
   });
   
   // Apply promo code event
   $('#et-apply-promo-code').on('click', function(e) {
        //applyPromoReward();
   });
   $('#et-promocode').on('blur', function(e) {
        //applyPromoReward();
   });
   
   // Redirect back to home
//   $('#et-cust-serv-form').on('submit', function(e) {
//       e.preventDefault();
//       
//       $('.modal').modal('hide');
//       $('#back-to-home-modal').modal('show');
//       
//   });
   
   // Invoke section scrolling function
   scrollingToSections();
   
   // Invoke form validations
   etFormValidations();
   
   //===================================================
   
    /**
    * Apply the promotion reward
    * Display the amount section
    */
   function applyPromoReward(effectivePeriod) {
        var $promoField = $('#et-promocode');
        var $disPromo = $('#et-dis-promo-amount');
        var $actPromo = $('#et-act-promo-amount');
        
        // Modify code to do the actual promotion
        // Do the actual calculation
        //var isValid = $promoField.val();
        
        if(effectivePeriod != null && effectivePeriod == '12'){
            $disPromo.removeClass('hidden')
            //$disPromo.find('.bottom .et-amount')
            //         .html('HK$ 900 <span>/per month</span>');
            //$disPromo.find('.bottom .et-per et-month')
            //         .text('(only HK$ 100 per day)');
                     
            $actPromo.find('.top .et-po-amount-label')
                     .text('2nd - 20th policy year');
        } else {
            $disPromo.addClass('hidden');
            $actPromo.find('.top .et-po-amount-label')
                     .text('first 20 policy years');
        }
   }
   
   /**
   * Groups the scrolling to each section functions
   */
   function scrollingToSections() {
      // Move to before we start section
      //$('#select-plan').on('click', function(e) {
      //   $('body, html').animate({
      //      scrollTop: ($('#et-select-plan-section').offset().top - stickyHeight) + 'px'
      //   }, 500);
      //});
      
      // Move to About your self section
      $('#et-btn-before-start').on('click', function(e) {
         var $self = $(this);
         var $aboutYourSelf = $('#et-about-yoursel-section');
         
         $self.removeClass('et-pad-bot-50');
         $aboutYourSelf.removeClass('hide-element')
                        .css('margin-bottom', '125px');
         
         $('body, html').animate({
            scrollTop: ($aboutYourSelf.offset().top - stickyHeight) + 'px'
         }, 500);
         
         // Store plan detail data 
         if ($('#et-before-yes').prop('checked')) {
            planDetailData.hasExsingInsurancePoliscy = true;
         } else if ($('#et-before-no').prop('checked')) {
            planDetailData.hasExsingInsurancePoliscy = false;
         }
      });
      
      // Move to Plan option section
      // $('#et-btn-ay-self').on('click', function(e) {
      //    var $self = $(this);
      //    var $planOption = $('#et-plan-option-section');
         
      //    $self.removeClass('et-pad-bot-50');
      //    $('#et-about-yoursel-section').removeAttr('style');
      //    $planOption.removeClass('hide-element');
         
      //    if(getWidth()>=992){
      //       $('.et-collapse-link[aria-expanded="true"]').parent()
      //                                              .next()
      //                                              .find('.et-panel-body')
      //                                              .jScrollPane({showArrows: true});
      //    }
         
      //    $('body, html').animate({
      //       scrollTop: ($planOption.offset().top - stickyHeight) + 'px'
      //    }, 500);
         
      //    // Store plan detail data
      //    if ($('#et-gender-male').prop('checked')) {
      //       planDetailData.gender = 'Male';
      //    } else if ($('#et-gender-female').prop('checked')) {
      //       planDetailData.gender = 'Female';
      //    }
         
      //    if ($('#et-smoker-yes').prop('checked')) {
      //       planDetailData.isSmooker = true;
      //    } else if ($('#et-smoker-no').prop('checked')) {
      //       planDetailData.isSmooker = false;
      //    }
         
      //    planDetailData.dob = $planDate.val();
      // });
   
      // Move to Medical declaration section
      $('#et-brn-proceed-to-application').on('click', function(e) {
         var $self = $(this);
         
         // Store plan detail data
         var sliderVal = $('#et-slider-range').text();
         var monthlyPrem = $('#et-month-dis-amount').text();
         
         $('#etaspd-insured-amount').html('HK$ '+ sliderVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
         $('#etaspd-monthly-premium').html('HK$ '+ monthlyPrem.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
         
         if ($self.hasClass('back-to-app')) {
            // Go back to the application form
            $('#et-select-plan-section').addClass('hide-element');
            currentSection = 'et-application-first-section';
            
            $('body, html').animate({
                scrollTop: ($('#et-application-info-section').offset().top - stickyHeight) + 'px'
            }, 500); 
         } else {
            // Open login modal
            $('#loginModal').modal('show');
         }
      });
      
      // Move to Application Info section
      $('#et-medical-dec-next').on('click', function(e) {
            var $self = $(this);
            var $target = null;
            
            if (isMedicAnswered()) {
               $target = $('#et-application-info-section');
               $target.removeClass('hide-element');
               
               $('#et-application-first-section').removeAttr('style');
               
               // Remve datepicker
               $infoDOB.datepicker('remove');
   
               // Store application info data
               appInfoData.medicalDecStatus = false;
               
               // Update app info dob
               if (planDetailData.dob && (planDetailData.dob !== 'DD-MM-YYYY')) {
                  $('#sales-illu-dob').val(planDetailData.dob);
               }
               
               // Update app info gender
               if (planDetailData.gender) {
                  $('#savieApplicantBean\\.gender').val(planDetailData.gender);
               }
               
               // Disable scrolling to the select plan section
               // Update current section flag
               if (currentSection === 'et-select-plan-section') {
                  $('#' + currentSection).addClass('hide-element');
               }
               currentSection = 'et-application-first-section';
            } else {
               $target = $('#et-application-first-section');
               
               // Store application info data
               appInfoData.medicalDecStatus = true;
            }
            
            $('body, html').animate({
               scrollTop: ($target.offset().top - stickyHeight) + 'px'
            }, 500);
      });
      
      // Move to Declaration section
      $('#et-beneficiary-info-next').on('click', function(e) {
         var $self = $(this);
         var $target = '';
         
         if (isBeneficaryValid()) {
            $target = $('#et-application-second-section');
            $target.removeClass('hide-element');
            
            $('body, html').animate({
                  scrollTop: ($target.offset().top - stickyHeight) + 'px'
            }, 500);
            
            // Store beneficiaries data
            storeBeneficiaryInfo();
         } else {
            $('body, html').animate({
                  scrollTop: ($('#et-beneficiary-info-section').offset().top - stickyHeight) + 'px'
            }, 0);
         }
      });
      
      function checkCheckBoxBySelectPay() {
    	  var result = true;
     	 if(!$('#pics-check').is(':checked')) {
     		 $("#chk1").html(getBundle(getBundleLanguage, "et.selectPlan.Please.check"));
     		 result = false;
     	 }else {
     		 $("#chk1").html("");
     	 }
     	 if(!$('#cancellation-check').is(':checked')) {
     		 $("#chk2").html(getBundle(getBundleLanguage, "et.selectPlan.Please.check"));
     		 result = false;
     	 }else {
     		 $("#chk2").html("");
     	 }
     	 if(!$('#application-declaration').is(':checked')) {
     		 $("#chk3").html(getBundle(getBundleLanguage, "et.selectPlan.Please.check"));
     		 result = false;
     	 }else {
     		 $("#chk3").html("");
     	 }
     	 if(!result){
     		 return false;
     	 }
      }
      
      // Show Application Summary section
      $('#et-app-sum-proceed-btn').on('click', function(e) { 
    	 if(!checkCheckBoxBySelectPay()){
    		 return false;
    	 }
    	  
         var $self = $(this);
         var $appSum = $('#et-application-third-section');
         var $confirmSign = $('#et-declaration-proceed-btn');
         
         // Populate information in application summary
         populateAppSummPD();
         populateAppSummPI();
         populateAppSummEI();
         populateAppSummBI();
         
         // Remove confirm and sign button
         // and align view summary button to center
         $confirmSign.parent()
                     .addClass('hidden');
         $self.parent()
               .removeClass('col-md-6')
               .addClass('et-selected col-md-12')
         
         //res address
         if($('#etaspi-res-add').html().length <= 0) {
        	 $('#etaspi-res-add').html($('#etaspi-per-add').html());
         }
         //corr address
         if($('#etaspi-corr-add').html().length <= 0) {
        	 $('#etaspi-corr-add').html($('#etaspi-res-add').html());
         }
         $appSum.removeClass('hide-element');
         
         $('body, html').animate({
            scrollTop: ($appSum.offset().top - stickyHeight) + 'px'
         }, 500);
      });
      
      // APPLICATION SUMMARY EDIT buttons
      // Move to specific sections
      $(document).on('click', '.et-app-sum-edit', function(e) {
         e.preventDefault();
         var $self = $(this);
         var $target = $($self.data('target'));
         
         //hide summary
         $('#et-application-third-section').addClass('hide-element');
         $('#et-app-sum-proceed-btn').parent().removeClass('col-md-12').addClass('col-md-6');
         $('#et-declaration-proceed-btn').parent().removeClass('hidden');
         
         
         if (($self.data('target') === '#et-about-yoursel-section') || $self.data('target') === '#et-plan-option-section') {
            currentSection = 'et-select-plan-section';
            $('#' + currentSection).removeClass('hide-element');
            
            $('#et-brn-proceed-to-application').addClass('back-to-app')
                                               .text('Back to application');
            
            
            $('body, html').animate({
                scrollTop: ($target.offset().top - stickyHeight) + 'px'
            }, 500); 
         } else {
            $('body, html').animate({
                scrollTop: ($target.offset().top - stickyHeight) + 'px'
             }, 0);
         }
      });
      
      // Move to signature section
      $('#et-confirm-and-sign-btn, #et-declaration-proceed-btn').on('click', function(e) {
         e.preventDefault();
         
         if(!checkCheckBoxBySelectPay()){
    		 return false;
    	 }
         
         var $self = $(this);
         var $sigSection = $('#et-application-fourth-section');
         
         $sigSection.removeClass('hide-element');
         
         if (!$("#signature").find('canvas').length) {
            // Initialize signature area
            $("#signature").jSignature({
               height: '350px', 
               width: '100%',
               'decor-color': 'transparent',
            }).on('change', function(e) {
               var $self = $(this);
               
               if ($("#signature").jSignature('getData', 'native').length) {
                  $self.siblings('.correct-signature')
                        .removeClass('hide-element');
               } else {
                  $self.siblings('.correct-signature')
                        .addClass('hide-element');
               }
            });
            
            // Signature clear
            $(document).on('click', '#et-clear-signature', function(e) {
               e.preventDefault();
               
               $('#signature').jSignature('clear');
               $(this).parent()
                     .siblings('.correct-signature')
                     .addClass('hide-element');
            });
         }
         
         $('body, html').animate({
            scrollTop: ($sigSection.offset().top - stickyHeight) + 'px'
         }, 500);
      });
   }// END OF GROUPS THE SCROLLING TO EACH SECTION FUNCTIONS  
   
   /**
   * Form validation for application info and employment info
   */
   function etFormValidations() {
      //Application Info
      $('#eliteTermsInsuredInfoForm').bootstrapValidator({
         excluded: [':disabled', ':hidden', ':not(:visible)'
                     // 'input[name="savieApplicantBean.firstName"]',
                     //'input[name="savieApplicantBean.lastName"]',
                     //'input[name="savieApplicantBean.chineseName"]'
                  ],
         fields: {
            "savieApplicantBean.firstName": {
               container: '#savieApplicantBeanFirstNameMsg',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.enter.your.Given.Name.in.English")
                  },
                  stringLength: {
                     max: 25,
                     message: getBundle(getBundleLanguage, "et.selectPlan.Given.Name.must.be.no.more.than.25.characters")
                  },
                  regexp: {
                     regexp: /^[a-zA-Z\s]*$/,
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.enter.your.Given.Name.in.English")
                  },
                  callback: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.enter.your.Given.Name.in.English"),
                     callback: function(value, validator) {
                        return value !== document.getElementById('savieApplicantBean.firstName').getAttribute('placeholder');
                     }
                  }
               }
            },
            "savieApplicantBean.lastName": {
               container: '#savieApplicantBeanlastNameMsg',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.enter.your.Last.Name.in.English")
                  },
                  stringLength: {
                     max: 25,
                     message: getBundle(getBundleLanguage, "et.selectPlan.Given.Name.must.be.no.more.than.25.characters")
                  },
                  regexp: {
                     regexp: /^[a-zA-Z\s]*$/,
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.enter.your.Last.Name.in.English")
                  },
                  callback: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.enter.your.Last.Name.in.English"),
                     callback: function(value, validator) {
                        return value !== document.getElementById('savieApplicantBean.lastName').getAttribute('placeholder');
                     }
                  }
               }
            },
            "savieApplicantBean.chineseName": {
               container: '#savieApplicantBeanchineseNameMsg',
               validators: {
                  stringLength: {
                     max: 6,
                     message: getBundle(getBundleLanguage, "et.selectPlan.Given.Name.must.be.no.more.than.6.characters")
                  },
                  regexp: {
                     regexp: /[^\x00-\x7F\s]/,
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.enter.your.Name.in.Chinese")
                  }
               }
            },
            "dob": {
               container: '#sales-illu-dob-msg',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.enter.your.Date.of.birth")
                  }
               }
            },
            "savieApplicantBean.hkId": {
               container: '#hkidMessage',
               trigger: 'blur',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.HKID.is.required")
                  },
//                  regexp: {
//                     regexp: /(^[A-Z|1-9]){1}([A-Z|1-9]){6}\(?([A-Z|1-9]){1}\)?$/g,
//                     message: 'Invalid HKID.'
//                  },
                  callback: {
                     message: 'Invalid HKID',
                     callback: function(value, validator) {
                        return isValidHKID(value);
                     }
                  }
               }
            },
            "savieApplicantBean.maritalStatus": {
               container: '#maritalStatusMessage',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Marital.status.is.required")
                  }
               }
            },
            "savieApplicantBean.placeOfBirth": {
               container: '#placeOfBirthMessage',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Place.of.birth.is.required")
                  }
               }
            },
            "savieApplicantBean.nationality": {
               container: '#nationalityMessage',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Nationality.is.required")
                  }
               }
            },
            /* "savieApplicantBean[0].residentialTelNo": {
               container: '#resPrefixMessage',
               validators: {
                  notEmpty: {
                     message: 'Telephone prefix is required.'
                  },
                  stringLength: {
                     min: 3,
                     max: 3,
                     message: 'Your Residential Tel No. is invalid.'
                  }
               }
            },
            "savieApplicantBean[1].residentialTelNo": {
               container: '#resSuffixMessage',
               validators: {
                  notEmpty: {
                     message: 'Telephone suffix is required.'
                  },
                  stringLength: {
                     min: 8,
                     max: 8,
                     message: 'Your Residential Tel No. is invalid..'
                  },
                  callback: {
                     message: 'Your Residential Tel No. is invalid.',
                     callback: function(value, validator) {
                        return value !== document.getElementById('residential-second').getAttribute('placeholder');
                     }
                  }
               }
            }, */
            /* "savieApplicantBean[0].mobileNo": {
               container: '#mobilePrefixMessage',
               validators: {
                  notEmpty: {
                     message: 'Mobile prefix is required.'
                  },
                  stringLength: {
                     min: 3,
                     max: 3,
                     message: 'Your Residential Tel No. is invalid..'
                  }
               }
            },
            "savieApplicantBean[1].mobileNo": {
               container: '#mobileSuffixMessage',
               validators: {
                  notEmpty: {
                     message: 'Mobile suffix is required.'
                  },
                  stringLength: {
                     min: 8,
                     max: 8,
                     message: 'Your Residential Tel No. is invalid..'
                  },
                  callback: {
                     message: 'Your Residential Tel No. is invalid.',
                     callback: function(value, validator) {
                        return value !== document.getElementById('mobile-second').getAttribute('placeholder');
                     }
                  }
               }
            }, */
            "savieApplicantBean.residentialTelNo": {
               container: '#resTelMessage',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Telephone.number.is.required")
                  },
                  digits: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Invalid.Telephone.number")
                  }
               }
            },
            "savieApplicantBean.mobileNo": {
               container: '#mobileMessage',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Mobile.number.is.required")
                  },
                  digits: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Invalid.Mobile.number")
                  }
               }
            },
            "savieApplicantBean.emailAddress": {
               container: '#emailMessage',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Email.address.is.required")
                  },
                  emailAddress: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Provide.a.valid.email.address")
                  }
               }
            },
            "savieApplicantBean.residentialDistrict": {
               container: '#resDistrictMessage',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.select.a.district")
                  }
               }
            },
            "savieApplicantBean.residentialDistrictCountry": {
               container: '#residentialDistrictCountryMessage',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.select.a.country")
                  }
               }
            },
            "savieApplicantBean.permanentAddressCountry": {
               container: '#permanentAddressCountryMessage',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.select.a.country")
                  }
               }
            },
            "savieApplicantBean.permanentAddress": {
               container: '#perAddressMessage',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.select.a.district")
                  }
               }
            },
            "savieApplicantBean.correspondenceDistrict": {
               container: '#correspondenceDistrictMessage',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.select.a.district")
                  }
               }
            },
            "savieApplicantBean.correspondenceDistrictCountry": {
               container: '#correspondenceCountryMessage',
               validators: {
                  notEmpty: {
                     message: getBundle(getBundleLanguage, "et.selectPlan.Please.select.a.country")
                  }
               }
            },
         }
      }).on('success.form.bv', function(e) {
         e.preventDefault();
         var $form = $(this);
         var isValidAddLine = true;
         
         // Check if permanent address lines
         if (!isPerLineValid()) {
            $('#permanentAddressMessage').find('.help-block')
               .removeClass('hide-element');
            isValidAddLine = false;
         } else {
            $('#permanentAddressMessage').find('.help-block')
               .addClass('hide-element');
         }
         
         // Check if res address lines
         if (!isResLineValid()) {
            $('#residentialAddressMessage').find('.help-block')
               .removeClass('hide-element');
            isValidAddLine = false;
         } else {
            $('#residentialAddressMessage').find('.help-block')
               .addClass('hide-element');
         }
         
         // Check if corr address lines
         if (!isCorrLineValid()) {
            $('#corrAddressMessage').find('.help-block')
               .removeClass('hide-element');
            isValidAddLine = false;
         } else {
            $('#corrAddressMessage').find('.help-block')
               .addClass('hide-element');
         }
         
         if (!isValidAddLine) {
            $('body, html').animate({
               scrollTop: ($('#et-application-info-section').offset().top - stickyHeight) + 'px'
            }, 0);
            return false;
         }
         
         //isAppDobValid();
         
         $('#et-personal-info-next').removeAttr('disabled');
         var $ben = $('#et-employment-info-section');
         
         $ben.removeClass('hide-element')
               .css('margin-bottom', '280px');
         
         $('body, html').animate({
            scrollTop: ($ben.offset().top - stickyHeight) + 'px'
         }, 500);
      
         //Store application info data
         storeAppInfo();
      }).on('error.form.bv', function(e) {
         var $bv = $(this).data('bootstrapValidator');
         var isValid = false;
         var isValidAddLine = true;
         
         // Check if permanent address lines
         if (!isPerLineValid()) {
            $('#permanentAddressMessage').find('.help-block')
               .removeClass('hide-element');
            isValidAddLine = false;
         } else {
            $('#permanentAddressMessage').find('.help-block')
               .addClass('hide-element');
         }
         
         // Check if res address lines
         if (!isResLineValid()) {
            $('#residentialAddressMessage').find('.help-block')
               .removeClass('hide-element');
            isValidAddLine = false;
         } else {
            $('#residentialAddressMessage').find('.help-block')
               .addClass('hide-element');
         }
         
         // Check if corr address lines
         if (!isCorrLineValid()) {
            $('#corrAddressMessage').find('.help-block')
               .removeClass('hide-element');
            isValidAddLine = false;
         } else {
            $('#corrAddressMessage').find('.help-block')
               .addClass('hide-element');
         }
         
         if (!isValidAddLine) {
            $('body, html').animate({
               scrollTop: ($('#et-application-info-section').offset().top - stickyHeight) + 'px'
            }, 0);
            return false;
         }
         
         if ($bv.$invalidFields.length == 1) {
            for (var i=0; i<$bv.$invalidFields.length; i++) {
               if (($bv.$invalidFields[0].getAttribute('id') === "sales-illu-dob") && $bv.$invalidFields[0].value) {
                  isValid = true;
                  break;
               }
            }
         }
         
         if (isValid) {
            $('#et-personal-info-next').removeAttr('disabled');
            var $ben = $('#et-employment-info-section');
            
            $ben.removeClass('hide-element')
                  .css('margin-bottom', '280px');
            
            $('body, html').animate({
               scrollTop: ($ben.offset().top - stickyHeight) + 'px'
            }, 500);
            
            //Store application info data
            storeAppInfo();
         } else {
            $('body, html').animate({
               scrollTop: ($('#et-application-info-section').offset().top - stickyHeight) + 'px'
            }, 0);
         }
      });
      
      // Employment Info
      $('#etEmploymentInfoForm').bootstrapValidator({
         fields: {
            "savieEmploymentBean.employmentStatus": {
               container: '#employmentStatusMessage',
               validators: {
                  notEmpty: {
                     message: 'Please select your Employment Status.'
                  }
               }
            },
            "savieEmploymentBean.occupation": {
               container: '#occupationMessage',
               validators: {
                  notEmpty: {
                     message: 'Please select your Occupation.'
                  }
               }
            },
            "savieEmploymentBean.liquidAssets": {
               container: '#liquidAssets',
               validators: {
                  notEmpty: {
                     message: 'Liquid asset is required.'
                  }
               }
            },
            "savieEmploymentBean.educationLevel": {
               container: '#educationLevelMessage',
               validators: {
                  notEmpty: {
                     message: 'Please select your Education level.'
                  }
               }
            },
            "savieEmploymentBean.natureOfBusiness": {
               container: '#natureOfBusinessMessage',
               validators: {
                  notEmpty: {
                     message: 'Please select your Nature of Business.'
                  }
               }
            },
            "savieEmploymentBean.monthlyPersonalIncome": {
               container: '#monthlyIncomeMessage',
               validators: {
                  notEmpty: {
                     message: 'Please select your Monthly Personal Income ($HK).'
                  }
               }
            },
            "savieEmploymentBean.currentEmployerName": {
                container: '#employerNameMessage',
                validators: {
                   notEmpty: {
                      message: 'Please enter your Current Employer\'s Name.'
                   }
                }
             }
         }
      }).on('success.form.bv', function(e) {
            e.preventDefault();
            var $form = $(this);
   
            if ($form.data('bootstrapValidator').isValid()) {
                  var $ben = $('#et-beneficiary-info-section');
                  
                  $ben.removeClass('hide-element');
                  
                  $('#et-employment-info-next').removeAttr('disabled');
                  $('#et-employment-info-section').removeAttr('style');
                  
                  $('body, html').animate({
                     scrollTop: ($ben.offset().top - stickyHeight) + 'px'
                  }, 500);
                  
                  // Modify the codes below 
                  // to manipulate the form data
                  
                  // Store employment info data
                  storeEmpInfo(); 
            } else {   
               $('body, html').animate({
                  scrollTop: ($('#et-employment-info-section').offset().top - stickyHeight) + 'px'
               }, 0);
            }
      }).on('error.form.bv', function(e) {
         $('body, html').animate({
            scrollTop: ($('#et-employment-info-section').offset().top - stickyHeight) + 'px'
         }, 0);
      });
      
   } // END OF FORM VALIDATION FOR APPLICATION INFO AND EMPLOYMENT INFO
   
   /**
   * Form Validation utility functions
   */
   // Check if application info dob is not empty
   function isAppDobValid() {
      var $dob = $('#sales-illu-dob');
            
      if (!$dob.val() || ($dob.val() === 'DD-MM-YYYY ')) {
         $dob.siblings('.error-msg')
               .find('.help-block')
               .removeClass('hide-element');
   
         return false;
      }
      
      return true;
   }
   
   // Check if application info en fname is not empty
   function isAppEnFNameValid() {
      var $obj = $('#savieApplicantBean\\.firstName');
      
      if (!$obj.val() || ($obj.val() === 'Given Name ')) {
         $obj.next('.error-msg')
            .find('.help-block')
            .removeClass('hide-element');
   
         return false;
      }
      
      return true;
   }
   
   // Check if application info en lname is not empty
   function isAppEnLNameValid() {
      var $obj = $('#savieApplicantBean\\.lastName');
      
      if (!$obj.val() || ($obj.val() === 'Last Name ')) {
         $obj.next('.error-msg')
            .find('.help-block')
            .removeClass('hide-element');
   
         return false;
      }
      
      return true;
   }
   
   // Check if application info ch name is not empty
   function isAppChNameValid() {
      var $obj = $('#savieApplicantBean\\.chineseName');
      
      if (!$obj.val() || ($obj.val() === 'Name in Chinese ')) {
         $obj.next('.error-msg')
            .find('.help-block')
            .removeClass('hide-element');
            
         return true;
      }
      
      return false;
   }
   
   // Check custom application info validation
   function isAppFormValid() {
      if (isAppEnFNameValid()) {
         return true;
      } else if (isAppEnLNameValid()) {
         return true;
      } else if (isAppChNameValid()) {
         return true;
      } else if (isAppDobValid()) {
         return true;
      }
      
      return false;
   }
   
   // Dob change event
   $('#sales-illu-dob, #savieApplicantBean\\.firstName, #savieApplicantBean\\.lastName, #savieApplicantBean\\.chineseName').on('change', function(e){
      var $self = $(this);
      
      if ($self.val()) {
         $self.next('.error-msg')
               .find('.help-block')
               .addClass('hide-element');
               
         $('#et-personal-info-next').removeAttr('disabled');
      }
   });
   
   // Update employment info fields, if employment status = unemployed
   $('#savieEmploymentBean\\.employmentStatus').on('change', function(e) {
      var $self = $(this);
      var value = $self.val().slice(0,3);
      if (value === 'ES1' || value === 'ES2' || value === 'ES3') {
         $('.et-emp-info-sourceOfIncome-container').addClass('hidden');
         $('.et-emp-info-liq-assets-container').addClass('hidden');
         $('.et-emp-info-nat-business-container').removeClass('hidden');
         $('.et-emp-info-occupation-container').removeClass('hidden');
         $('.et-emp-info-employer-name-container').removeClass('hidden');
         $('.et-emp-info-mon-income-container').removeClass('hidden');
      }
      else {
         $('.et-emp-info-nat-business-container').addClass('hidden');
         $('.et-emp-info-occupation-container').addClass('hidden');
         $('.et-emp-info-employer-name-container').addClass('hidden');
         $('.et-emp-info-mon-income-container').addClass('hidden');
         $('.et-emp-info-sourceOfIncome-container').removeClass('hidden');
         $('.et-emp-info-liq-assets-container').removeClass('hidden');
      }
   });
   
   // Determine if the previous question was answered
   function isMedicAnswered() {
      var result = true;
      
      $('.et-collapse').each(function() {
         if ($(this).attr('data-is-answered') !== 'true') {
            result = false;
            
            return false;
         }
      });
      
      return result;
   }
   
   // Check if all medic questions are answered with no
   function isMedicAnsweredWithNo() {
      var result = true;
      
      $('.et-btn-medic-no').each(function() {
         if (!$(this).hasClass('btn-selected')) {
            result = false;
            
            return false;
         }
      });
      
      return result;
   }
   
   function fnSetStyle(){
      if($('.datepicker.datepicker-dropdown').length){
         //datepicker exist
         
         var isVisible = $('.datepicker .datepicker-years table thead tr th:last-child').css("visibility");
         
         if(isVisible == "hidden"){
            //console.log('hidden');
            $('.datepicker .datepicker-years table thead tr th:last-child').removeAttr('style');
            $('.datepicker .datepicker-years table thead tr th:last-child').css(
            {"visibility":'visible !important',
            "cursor":"not-allowed"});
         }else{
            //console.log('vivible');
            $('.datepicker .datepicker-years table thead tr th:last-child').css(
            {"visibility":'visible !important',
            "cursor":"pointer"});
         }
      }else{
         //console.log('doesnot exist');
         //date picker does not exist
      }
   }
   
   // Utility function
   function capitalizeFirstLetter(string) {
      return string ? string.charAt(0).toUpperCase() + string.slice(1) : '';
   }
   function formatToCapEachLetter(string) {
      if (!string) {
         return '';
      }
      
      var arr = string.split('-');
      
      if (arr.length > 1) {
            
         for (var i=0; i<arr.length; i++) {
            arr[i] = capitalizeFirstLetter(arr[i]);
         }
         return arr.join(' ');
      } else {
         return capitalizeFirstLetter(arr[0]);
      }
      
   }
   
   // Application Info tooltip
   $('.btn-app-info-tooltip, .btn-beneficiary-tooltip').tooltip({
      trigger: 'hover focus click',
      container: 'body',
      template: 	'<div class="tooltip et-app-info-tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
      placement: tooltipPlacement
   });
   function tooltipPlacement(context, source) {
      var $source = $(source);
      var position = $source.position();
      
      if ($source.hasClass('btn-app-info-tooltip')) {
         if ((position.top >= 39) && (position.left < 230)) {
            return 'top';
         } else if ((position.top <= 6) && (position.left > 380) && (position.left < 560) && (getWidth() < 992)) {
            return 'left';
         } else {
            return 'right';
         }
      } else if ($source.hasClass('btn-beneficiary-tooltip')) {
         if (position.left < 350 ) {
            return 'left';
         } else {
            return 'right';
         }
      }
   }
   
   /**
   * Check if beneficiary form is valid
   */
   function isBeneficaryValid() { 
      var res1 = true; 
      var res2 = true; 
      var res3 = true;
      
      // Person 1
      if ($('#beneficiaryInfoForm\\[0\\]').length) {
         if (isBeneficiaryFormClear(0) || $('#beneficiaryInfoForm\\[0\\]').data('bootstrapValidator').isValid()) {
            res1 = true;
         } else {
            res1 = false;
            $('#beneficiaryInfoForm\\[0\\]').data('bootstrapValidator').validate();
         }
      } 
      
      // Person 2
      if ($('#beneficiaryInfoForm\\[1\\]').length) {
         if (isBeneficiaryFormClear(1) || $('#beneficiaryInfoForm\\[1\\]').data('bootstrapValidator').isValid()) {
            res2 = true;
         } else {
            res2 = false;
            $('#beneficiaryInfoForm\\[1\\]').data('bootstrapValidator').validate();
         }
      } 
      
      // Person 3
      if ($('#beneficiaryInfoForm\\[2\\]').length) {
         if (isBeneficiaryFormClear(2) || $('#beneficiaryInfoForm\\[2\\]').data('bootstrapValidator').isValid()) {
            res3 = true;
         } else {
            res3 = false;
            $('#beneficiaryInfoForm\\[2\\]').data('bootstrapValidator').validate();
         }
      }
      
      return res1 && res2 && res3;
   }
   function isBeneficiaryFormClear(pos) {
      var $form = $('#beneficiaryInfoForm\\[' + pos +'\\]');
  
      if (!document.getElementById('savieBeneficiaryBean[' + pos + '].firstName').value
            && !document.getElementById('savieBeneficiaryBean[' + pos + '].lastName').value
            && !document.getElementById('savieBeneficiaryBean[' + pos +'].chineseName').value
            && (!document.getElementById('savieBeneficiaryBean[' + pos + '].hkId').value || !document.getElementById('savieBeneficiaryBean[' + pos + '].passportNo').value)
            && !document.getElementById('savieBeneficiaryBean[' + pos + '].entitlement').value
            && !document.getElementById('savieBeneficiaryBean[' + pos + '].relationship').value
         ) {
    	  $('#beneficiaryInfoForm\\[' + pos +'\\]').find('#remove-beneficiary\\[' + pos +'\\]').trigger('click');
         return true;
      }
      
      return false;
   }
      
   /**
   * Populate the application summary with filled in data 
   */
   function populateAppSummPD() {
      //$('#etaspd-insured-amount').text('HK$ ' + planDetailData.insuranceAmount);
   }
   function populateAppSummPI() {
      $('#etaspi-en-lname').text(appInfoData.enLName);
      $('#etaspi-fname').text(appInfoData.enFName);
      $('#etaspi-chName').text(appInfoData.chName);
      $('#etaspi-gender').text(appInfoData.gender);
      $('#etaspi-is-smooker').text(planDetailData.isSmooker ? 'Smooker' : 'Non-smooker');
      $('#etaspi-marital-status').text(capitalizeFirstLetter(appInfoData.maritalStat));
      $('#etaspi-dob').text(appInfoData.dob);
      $('#etaspi-pob').text(appInfoData.pob);
      $('#etaspi-nationality').text(appInfoData.nationality);
      $('#etaspi-email').text(appInfoData.email);
      
      /* var _tempTelSuffix = '';
      if (appInfoData.resTelNoSuffix.length > 4) {
         _tempTelSuffix = appInfoData.resTelNoSuffix.slice(0, 4) + '-' + appInfoData.resTelNoSuffix.slice(4);
      } else {
         _tempTelSuffix = appInfoData.resTelNoSuffix;
      }
      $('#etaspi-tel-no').text('+' + appInfoData.resTelNoPrefix + ' ' + _tempTelSuffix);    */
      $('#etaspi-tel-no').text(appInfoData.resTelNo);   
      
      /* var _tempMobSuffix = '';
      if (appInfoData.resTelNoSuffix.length > 4) {
         _tempMobSuffix = appInfoData.mobNoSuffix.slice(0, 4) + '-' + appInfoData.mobNoSuffix.slice(4);
      } else {
         _tempMobSuffix = appInfoData.resTelNoSuffix;
      }
      $('#etaspi-mob-no').text('+' + appInfoData.mobNoPrefix + ' ' + _tempMobSuffix);   */ 
      $('#etaspi-mob-no').text(appInfoData.mobNo);   
      
      var perAddArr = [];
      if (appInfoData.perAddL1) {
         perAddArr.push(appInfoData.perAddL1);
      }
      if (appInfoData.perAddL2) {
         perAddArr.push(appInfoData.perAddL2);
      }
      if (appInfoData.perAddL3) {
         perAddArr.push(appInfoData.perAddL3);
      }
      (appInfoData.perAdd) ? perAddArr.push(appInfoData.perAdd) : '';
      // perAddArr.push(appInfoData.perAddCountry);
      $('#etaspi-per-add').text(perAddArr.join(', '));
      
      if ($('#savieApplicantBean\\.isResidential').prop('checked')) {
         //$('.et-res-add').removeClass('hide-element');
            
         var resAddArr = [];
         if (appInfoData.resAddL1) {
            resAddArr.push(appInfoData.resAddL1);
         }
         if (appInfoData.resAddL2) {
            resAddArr.push(appInfoData.resAddL2);
         }
         if (appInfoData.resAddL3) {
            resAddArr.push(appInfoData.resAddL3);
         }
         (appInfoData.resAdd) ? resAddArr.push(appInfoData.resAdd) : '';
         // resAddArr.push(appInfoData.resAddCountry);
         $('#etaspi-res-add').text(resAddArr.join(', '));
      } else {
         //$('.et-res-add').addClass('hide-element');
      }
      
      if ($('#savieApplicantBean\\.addressIsSame').prop('checked')) {
         //$('.et-corr-add').removeClass('hide-element');
            
         var corrAddArr = [];
         if (appInfoData.corrAddL1) {
            corrAddArr.push(appInfoData.corrAddL1);
         }
         if (appInfoData.corrAddL2) {
            corrAddArr.push(appInfoData.corrAddL2);
         }
         if (appInfoData.corrAddL3) {
            corrAddArr.push(appInfoData.corrAddL3);
         }
         (appInfoData.corrAddL) ? corrAddArr.push(appInfoData.corrAddL) : '';
         // corrAddArr.push(appInfoData.corrAddCountry);
         $('#etaspi-corr-add').text(corrAddArr.join(', '));
      } else {

         //$('.et-corr-add').addClass('hide-element');
      }
      
   }
   function populateAppSummEI() {
	  var self = $('#savieEmploymentBean\\.employmentStatus');
	  var value = self.val().slice(0,3);
      if (value === 'ES4' || value === 'ES5' || value === 'ES6' || value === 'ES7') {
         $('.et-stat-unemployed').removeClass('hide-element');
         $('.et-not-stat-unemployed').addClass('hide-element');
         $('#etasei-liq-asset').text(empEduInfoData.liqAsset);
         $('#etasei-source-income').text(empEduInfoData.sourceIncome);
      } else {
         $('.et-not-stat-unemployed').removeClass('hide-element');
         $('.et-stat-unemployed').addClass('hide-element');
         $('#etasei-occupation').text(formatToCapEachLetter(empEduInfoData.occupation));
         $('#etasei-nat-business').text(formatToCapEachLetter(empEduInfoData.natBusiness));
         $('#etasei-mon-income').text(formatToCapEachLetter(empEduInfoData.monIncome));
      }
      
      $('#etasei-emp-status').text(formatToCapEachLetter(empEduInfoData.status));
      $('#etasei-edu-level').text(formatToCapEachLetter(empEduInfoData.eduLevel));
      $('#etasei-employer-name').text(formatToCapEachLetter(empEduInfoData.empName));
   }
   function populateAppSummBI() {
      // ???
      
      if ($('#name-others-now').prop('checked')) {
         // person 1
         if (beneInfoData.first && beneInfoData.first.saved) {
            $('.et-person-1').removeClass('hide-element');
            
            beneInfoData.first.enFName ? $('#etasbi-en-fname-1').text(beneInfoData.first.enFName) : '';
            beneInfoData.first.enLName ? $('#etasbi-en-lname-1').text(beneInfoData.first.enLName) : '';
            beneInfoData.first.chName ? $('#etasbi-ch-name-1').text(beneInfoData.first.chName) : '';
            var hkidPassValue = beneInfoData.first.hkid ? beneInfoData.first.hkid : beneInfoData.first.passNo;
            (beneInfoData.first.hkid || beneInfoData.first.passNo) ? $('#etasbi-hkid-pass-1').text(hkidPassValue) : '';
            beneInfoData.first.relationship ? $('#etasbi-relationship-1').text(capitalizeFirstLetter(beneInfoData.first.relationship)) : '';
            beneInfoData.first.gender ? $('#etasbi-gender-1').text(beneInfoData.first.gender) : '';
            beneInfoData.first.entitlement ? $('#etasbi-entitlement-1').text('Person 1: ' + beneInfoData.first.entitlement + '%') : '';
         } else {
            $('.et-person-1').addClass('hide-element');
         }
         
         // person 2
         if (beneInfoData.second && beneInfoData.second.saved) {
            $('.et-person-2').removeClass('hide-element');
            
            beneInfoData.second.enFName ? $('#etasbi-en-fname-2').text(beneInfoData.second.enFName) : '';
            beneInfoData.second.enLName ? $('#etasbi-en-lname-2').text(beneInfoData.second.enLName) : '';
            beneInfoData.second.chName ? $('#etasbi-ch-name-2').text(beneInfoData.second.chName) : '';
            var hkidPassValue = beneInfoData.second.hkid ? beneInfoData.second.hkid : beneInfoData.second.passNo;
            (beneInfoData.second.hkid || beneInfoData.first.passNo) ? $('#etasbi-hkid-pass-2').text(hkidPassValue) : '';
            beneInfoData.second.relationship ? $('#etasbi-relationship-2').text(capitalizeFirstLetter(beneInfoData.second.relationship)) : '';
            beneInfoData.second.gender ? $('#etasbi-gender-2').text(beneInfoData.second.gender) : '';
            beneInfoData.second.entitlement ? $('#etasbi-entitlement-2').text('Person 2: ' + beneInfoData.second.entitlement + '%') : '';
         } else {
            $('.et-person-2').addClass('hide-element');
         }
         
         // person 3
         if (beneInfoData.third && beneInfoData.third.saved) {
            $('.et-person-3').removeClass('hide-element');
            
            beneInfoData.third.enFName ? $('#etasbi-en-fname-3').text(beneInfoData.third.enFName) : '';
            beneInfoData.third.enLName ? $('#etasbi-en-lname-3').text(beneInfoData.third.enLName) : '';
            beneInfoData.third.chName ? $('#etasbi-ch-name-3').text(beneInfoData.third.chName) : '';
            var hkidPassValue = beneInfoData.third.hkid ? beneInfoData.third.hkid : beneInfoData.third.passNo;
            (beneInfoData.third.hkid || beneInfoData.third.passNo) ? $('#etasbi-hkid-pass-3').text(hkidPassValue) : '';
            beneInfoData.third.relationship ? $('#etasbi-relationship-3').text(capitalizeFirstLetter(beneInfoData.third.relationship)) : '';
            beneInfoData.third.gender ? $('#etasbi-gender-3').text(beneInfoData.third.gender) : '';
            beneInfoData.third.entitlement ? $('#etasbi-entitlement-3').text('Person 3: ' + beneInfoData.third.entitlement + '%') : '';
         } else {
            $('.et-person-3').addClass('hide-element');
         }
      }
   }
   
   /**
   * Save all data from application field
   */
   function storeAppInfo() {
      appInfoData.enFName = document.getElementById('savieApplicantBean.firstName').value;
      appInfoData.enLName = document.getElementById('savieApplicantBean.lastName').value;
      appInfoData.chName = document.getElementById('savieApplicantBean.chineseName').value;
      appInfoData.dob = document.getElementById('sales-illu-dob').value;
      
      if ($('#et-gender-male').prop('checked')) {
          planDetailData.gender = 'Male';
       } else if ($('#et-gender-female').prop('checked')) {
          planDetailData.gender = 'Female';
       }
      
      appInfoData.gender = planDetailData.gender;
      appInfoData.maritalStat = $('option[value="' + document.getElementById('savieApplicantBean.maritalStatus').value + '"]', '#savieApplicantBean\\.maritalStatus').text();
      appInfoData.pob = $('option[value="' + document.getElementById('savieApplicantBean.placeOfBirth').value + '"]', '#savieApplicantBean\\.placeOfBirth').text();
      appInfoData.nationality = $('option[value="' + document.getElementById('savieApplicantBean.nationality').value + '"]', '#savieApplicantBean\\.nationality').text();
      appInfoData.resTelNo = document.getElementById('savieApplicantBean.residentialTelNo').value;
      appInfoData.mobNo = document.getElementById('savieApplicantBean.mobileNo').value;
      appInfoData.email = document.getElementById('savieApplicantBean.emailAddress').value;
      appInfoData.perAddL1 = document.getElementById('savieApplicantBean.permanentAddress1').value;
      appInfoData.perAddL2 = document.getElementById('savieApplicantBean.permanentAddress2').value;
      appInfoData.perAddL3 = document.getElementById('savieApplicantBean.permanentAddress3').value;
      appInfoData.perAdd = $('option[value="' + document.getElementById('savieApplicantBean.permanentAddress').value + '"]', '#savieApplicantBean\\.permanentAddress').text();
      //appInfoData.perAddCountry = document.getElementById('savieApplicantBean.permanentAddressCountry').value;

      // For the residential address
      if ($('#savieApplicantBean\\.isResidential').prop('checked')) {  
         appInfoData.resAddL1 = document.getElementById('savieApplicantBean.residentialAdress1').value;
         appInfoData.resAddL2 = document.getElementById('savieApplicantBean.residentialAdress2').value;
         appInfoData.resAddL3 = document.getElementById('savieApplicantBean.residentialAdress3').value;
         appInfoData.resAdd = $('option[value="' + document.getElementById('savieApplicantBean.residentialDistrict').value + '"]', '#savieApplicantBean\\.residentialDistrict').text();
         //appInfoData.resAddCountry = document.getElementById('savieApplicantBean.residentialDistrictCountry').value;
      }
      
      // For the correspondence address
      if ($('#savieApplicantBean\\.addressIsSame').prop('checked')) {
         appInfoData.corrAddL1 = document.getElementById('savieApplicantBean.correspondenceAdress1').value;
         appInfoData.corrAddL2 = document.getElementById('savieApplicantBean.correspondenceAdress2').value;
         appInfoData.corrAddL3 = document.getElementById('savieApplicantBean.correspondenceAdress3').value;
         appInfoData.corrAddL = $('option[value="' + document.getElementById('savieApplicantBean.correspondenceDistrict').value + '"]', '#savieApplicantBean\\.correspondenceDistrict').text();
         //appInfoData.corrAddCountry = document.getElementById('savieApplicantBean.correspondenceDistrictCountry').value;
      }
   }
   function isPerLineValid() {
      var l1 = document.getElementById('savieApplicantBean.permanentAddress1').value;
      var l2 = document.getElementById('savieApplicantBean.permanentAddress2').value;
      var l3 = document.getElementById('savieApplicantBean.permanentAddress3').value;
      
      return l1 || l2 || l3;
   }
   function isResLineValid() {
      if ($('#savieApplicantBean\\.isResidential').prop('checked')) {
         var l1 = document.getElementById('savieApplicantBean.residentialAdress1').value;
         var l2 = document.getElementById('savieApplicantBean.residentialAdress2').value;
         var l3 = document.getElementById('savieApplicantBean.residentialAdress3').value;
      
         return l1 || l2 || l3;
      }
      return true;
   }
   
   function isCorrLineValid() {
      if ($('#savieApplicantBean\\.addressIsSame').prop('checked')) {
         var l1 = document.getElementById('savieApplicantBean.correspondenceAdress1').value;
         var l2 = document.getElementById('savieApplicantBean.correspondenceAdress2').value;
         var l3 = document.getElementById('savieApplicantBean.correspondenceAdress3').value;
         
         return l1 || l2 || l3;
      }
      
      return true;
   }
   
   
   /**
   * Save all data from employee fields
   */
   function storeEmpInfo() {
	   
	   
	   
	   
	   empEduInfoData.status = document.getElementById('savieEmploymentBean.employmentStatus').value.split("-")[1];
       empEduInfoData.occupation = document.getElementById('savieEmploymentBean.occupation').value.split("-")[1];
       empEduInfoData.eduLevel = document.getElementById('savieEmploymentBean.educationLevel').value;
       empEduInfoData.natBusiness = document.getElementById('savieEmploymentBean.natureOfBusiness').value.split("-")[1];
       empEduInfoData.monIncome = document.getElementById('savieEmploymentBean.monthlyPersonalIncome').value.split("-")[1];
       empEduInfoData.liqAsset = $('option[value="' + document.getElementById('savieEmploymentBean.liquidAssets').value + '"]', '#savieEmploymentBean\\.liquidAssets').text();
       empEduInfoData.empName = document.getElementById('savieEmploymentBean.currentEmployerName').value;
       empEduInfoData.sourceIncome = $('option[value="' + document.getElementById('savieEmploymentBean.sourceOfIncome').value + '"]', '#savieEmploymentBean\\.sourceOfIncome').text();
   }
   
   /**
   * Save all data from beneficiaries fields
   */
   function storeBeneficiaryInfo() {
      if ($('#name-others-now').prop('checked')) {
         // Person 1
         beneInfoData.first = {};
         
         beneInfoData.first.enFName = document.getElementById('savieBeneficiaryBean[0].firstName').value;
         beneInfoData.first.enLName = document.getElementById('savieBeneficiaryBean[0].lastName').value;
         beneInfoData.first.chName = document.getElementById('savieBeneficiaryBean[0].chineseName').value;
         
         var benHKIDPASS = document.getElementById('beneficiaryHkidPassport[0]').value;
         
         if ((benHKIDPASS.toLowerCase().indexOf('hkid') > -1)) {
            beneInfoData.first.hkid = document.getElementById('savieBeneficiaryBean[0].hkId').value;
         } else if ((benHKIDPASS.toLowerCase().indexOf('passport') > -1)) { 
            beneInfoData.first.passNo = document.getElementById('savieBeneficiaryBean[0].passportNo').value;
         }
         
         if ($('#male-0').prop('checked')) {
            beneInfoData.first.gender = 'Male';
         } else if ($('#female-0').prop('checked')) {
            beneInfoData.first.gender = 'Female';
         }
         
         beneInfoData.first.relationship = $('option[value="' + document.getElementById('savieBeneficiaryBean[0].relationship').value + '"]', '#savieBeneficiaryBean\\[0\\]\\.relationship').text();
         beneInfoData.first.entitlement = document.getElementById('savieBeneficiaryBean[0].entitlement').value;
         
         if (beneInfoData.first.enFName) {
            beneInfoData.first.saved = true;
         }
         
         // Person 2
         if (document.getElementById('beneficiaryInfoForm[1]') && !$('#beneficiaryInfoForm\\[1\\]').hasClass('hidden')) {
            beneInfoData.second = {};
            
            beneInfoData.second.enFName = document.getElementById('savieBeneficiaryBean[1].firstName').value;
            beneInfoData.second.enLName = document.getElementById('savieBeneficiaryBean[1].lastName').value;
            beneInfoData.second.chName = document.getElementById('savieBeneficiaryBean[1].chineseName').value;
            
            var benHKIDPASS = document.getElementById('beneficiaryHkidPassport[1]').value;
            
            if ((benHKIDPASS.toLowerCase().indexOf('hkid') > -1)) {
               beneInfoData.second.hkid = document.getElementById('savieBeneficiaryBean[1].hkId').value;
            } else if ((benHKIDPASS.toLowerCase().indexOf('passport') > -1)) { 
               beneInfoData.second.passNo = document.getElementById('savieBeneficiaryBean[1].passportNo').value;
            }
            
            if ($('#male-1').prop('checked')) {
               beneInfoData.second.gender = 'Male';
            } else if ($('#female-1').prop('checked')) {
               beneInfoData.second.gender = 'Female';
            }
            
            beneInfoData.second.relationship = $('option[value="' + document.getElementById('savieBeneficiaryBean[1].relationship').value + '"]', '#savieBeneficiaryBean\\[1\\]\\.relationship').text();
            beneInfoData.second.entitlement = document.getElementById('savieBeneficiaryBean[1].entitlement').value;
            
            if (beneInfoData.second.enFName) {
               beneInfoData.second.saved = true;
            }
         }
         
         // Person 3
         if (document.getElementById('beneficiaryInfoForm[2]') && !$('#beneficiaryInfoForm\\[2\\]').hasClass('hidden')) {
            beneInfoData.third = {};
            
            beneInfoData.third.enFName = document.getElementById('savieBeneficiaryBean[2].firstName').value;
            beneInfoData.third.enLName = document.getElementById('savieBeneficiaryBean[2].lastName').value;
            beneInfoData.third.chName = document.getElementById('savieBeneficiaryBean[2].chineseName').value;
            
            var benHKIDPASS = document.getElementById('beneficiaryHkidPassport[2]').value;
            
            if ((benHKIDPASS.toLowerCase().indexOf('hkid') > -1)) {
               beneInfoData.third.hkid = document.getElementById('savieBeneficiaryBean[2].hkId').value;
            } else if ((benHKIDPASS.toLowerCase().indexOf('passport') > -1)) { 
               beneInfoData.third.passNo = document.getElementById('savieBeneficiaryBean[2].passportNo').value;
            }
            
            if ($('#male-2').prop('checked')) {
               beneInfoData.third.gender = 'Male';
            } else if ($('#female-2').prop('checked')) {
               beneInfoData.third.gender = 'Female';
            }
            
            beneInfoData.third.relationship = $('option[value="' + document.getElementById('savieBeneficiaryBean[2].relationship').value + '"]', '#savieBeneficiaryBean\\[2\\]\\.relationship').text();
            beneInfoData.third.entitlement = document.getElementById('savieBeneficiaryBean[2].entitlement').value;
            
            if (beneInfoData.third.enFName) {
               beneInfoData.third.saved = true;
            }
         }
      }
   }
