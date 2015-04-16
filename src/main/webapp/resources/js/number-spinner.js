// HIDE PAGE LOAD DIV FOR PLAN
$('#family_plan_desk_spinner').hide();
$('#family_plan_btm_spinner').hide();
$('#family_plan_mob_spinner').hide();
// ONCHANGE EVENT FOR PLAN RADIO BUTTON 

$(window).load(function(){
  if($('#divPersonsDesk').length){
    document.getElementById("divPersonsDesk").style.visibility = "visible";
      $('#lblCountDesk').show();
      $('#lblCountDesk').html(traveller + ' Traveller(s)');
      $('#lblPeopleDesk').html('' + traveller);
      
      
      var startDate = new Date($('#dp1').datepicker("getDate").valueOf());
      var endDate = new Date($('#dp2').datepicker("getDate").valueOf());
      var trCount = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);
      
      $("#lblDaysDesk").html(trCount);
      $('#lblDaysBtm').html(trCount);
      $('#lblDaysMob').html(trCount);
      
  }
  
  if($('#divPersonsBtm').length){
      document.getElementById("divPersonsBtm").style.visibility = "visible";
        $('#lblCountBtm').show();
        $('#lblCountBtm').html(traveller + ' Traveller(s)');
        $('#lblPeopleBtm').html('' + traveller);
    }
  
  if($('#divPersonsMob').length){
      document.getElementById("divPersonsMob").style.visibility = "visible";
        $('#lblCountMob').show();
        $('#lblCountMob').html(traveller + ' Traveller(s)');
        $('#lblPeopleMob').html('' + traveller);
    }
});

function changeSpinnerValue(valElm, val){
	var lblElm = valElm.closest(".number-spinner").find(".input-number");
	lblElm.html(val);
	valElm.val(val);
}

$('.plan').change(function () {
  
    var id = this.id;
    var show_div =  '#'+ id + '_spinner';
    var parent_id = $(this).attr('data-id');


    $('.plan_spinner_' + parent_id).hide();
    $(show_div).show();
    // TODO, to be checked
    $('#family_desk_count').val(0);
    $('#family_btm_count').val(0);
    $('#family_mob_count').val(0);

  // to set 0 val when change event occurence 

    if(parent_id =='desk')
    {
      $('#lblCountDesk').html('');
        if(id == 'personal_plan_desk')
    {
          document.getElementById("divPersonsDesk").style.visibility = "visible";
            $('#lblCountDesk').show();
            $('#lblCountDesk').html(personalTraveller + ' Traveller(s)');
            $('#lblPeopleDesk').html('' + personalTraveller);
            
            var parent = $('.plan_spinner_' + parent_id);
          changeSpinnerValue(parent.find(' #txtAdultsDesk'), 1);
          changeSpinnerValue(parent.find(' #txtChildDesk'), 0);
          changeSpinnerValue(parent.find(' #txtOtherDesk'), 0);
          
      changeSpinnerValue($('#txtTravellersDesk'), 1);
      
            personalTraveller=$('#txtTravellersDesk').val();
            $('#lblCountDesk').html(personalTraveller + ' Traveller(s)');
            $('#lblPeopleDesk').html('' + personalTraveller);
        }
        else if(id  == 'family_plan_desk') 
        {   
          var parent = $('.plan_spinner_' + parent_id);
          changeSpinnerValue(parent.find(' #txtAdultsDesk'), familyAdult);
          changeSpinnerValue(parent.find(' #txtChildDesk'), familyChild);
          changeSpinnerValue(parent.find(' #txtOtherDesk'), familyOther);
            
            document.getElementById("divPersonsDesk").style.visibility = "visible";
            $('#lblCountDesk').show();
            $('#lblCountDesk').html(familyTraveller + ' Traveller(s)');
            $('#lblPeopleDesk').html('' + familyTraveller);
            $('#family_desk_count').val(familyTraveller);
        }else
        {
            document.getElementById("divPersonsDesk").style.visibility = "hidden";
            $('#lblCountDesk').show();
            $('#lblCountDesk').html('');
            $('#lblPeopleDesk').html('');
            $('#family_desk_count').val('');       
        }
        
    }else if(parent_id =='mob')
    {      
      $('#lblCountMob').html('');      
      if(id  == 'family_plan_mob') 
      {
        var parent = $('.plan_spinner_' + parent_id);
        changeSpinnerValue(parent.find(' #txtAdultsMob'), familyAdult);
        changeSpinnerValue(parent.find(' #txtChildMob'), familyChild);
        changeSpinnerValue(parent.find(' #txtOtherMob'), familyOther);
        
          document.getElementById("divPersonsMob").style.visibility = "visible";
          $('#lblCountMob').show();
          $('#lblCountMob').html(familyTraveller + ' Traveller(s)');
          $('#lblPeopleMob').html('' + familyTraveller);
          $('#family_mob_count').val(familyTraveller);
         
      }else
      {
        var parent = $('.plan_spinner_' + parent_id);
        changeSpinnerValue(parent.find(' #txtAdultsMob'), 1);
        changeSpinnerValue(parent.find(' #txtChildMob'), 0);
        changeSpinnerValue(parent.find(' #txtOtherMob'), 0);
          
        $('#lblCountMob').show();
          $('#lblCountMob').html('');
          $('#lblPeopleMob').html('');
          $('#family_mob_count').val('');
          
          document.getElementById("divPersonsMob").style.visibility = "visible";
          
          
          changeSpinnerValue($('#txtTravellersMob'), 1);          
          personalTraveller= $('#txtTravellersMob').val();
          $('#lblCountMob').html(personalTraveller + ' Traveller(s)');
          $('#lblPeopleMob').html('' + personalTraveller);
          
          
          
          
      }
      

    }else   // Bottom plan selector
    {

      $('#lblCountBtm').html('');      
      if(id  == 'family_plan_btm') 
      {
        var parent = $('.plan_spinner_' + parent_id);
        changeSpinnerValue(parent.find(' #txtAdultsBtm'), familyAdult);
        changeSpinnerValue(parent.find(' #txtChildBtm'), familyChild);
        changeSpinnerValue(parent.find(' #txtOtherBtm'), familyOther);
        
          document.getElementById("divPersonsBtm").style.visibility = "visible";
          $('#lblCountBtm').show();
          $('#lblCountBtm').html(familyTraveller + ' Traveller(s)');
          $('#lblPeopleBtm').html('' + familyTraveller);
          $('#family_btm_count').val(familyTraveller);
 
      }else
      {
        var parent = $('.plan_spinner_' + parent_id);
        changeSpinnerValue(parent.find(' #txtAdultsBtm'), 1);
        changeSpinnerValue(parent.find(' #txtChildBtm'), 0);
        changeSpinnerValue(parent.find(' #txtOtherBtm'), 0);
        
          $('#lblCountBtm').show();
          $('#lblCountBtm').html('');
          $('#lblPeopleBtm').html('');
          $('#family_btm_count').val('');
          
          document.getElementById("divPersonsDesk").style.visibility = "visible";          
          changeSpinnerValue($('#txtTravellersBtm'), 1);          
          personalTraveller=$('#txtTravellersBtm').val();
          $('#lblCountBtm').html(personalTraveller + ' Traveller(s)');
          $('#lblPeopleBtm').html('' + personalTraveller);

      }
      
    }
    
});
// PLUS AND MINUS BUTTON EVENT TO CONTROLL TRAVERLLER PEOPLE
$('.btn-number').click(function(e){
    e.preventDefault();
    
    fieldName = $(this).attr('data-field');
    type      = $(this).attr('data-type');
    var input = $("input[id='"+fieldName+"']");
    var label = $(this).closest(".number-spinner").find(".input-number");
      //PARENT ID CHECK PLAN PERSONAL OR FAMILY
    plan = $(this).attr('data-parent');
    var currentVal = parseInt(input.val());
    if (!isNaN(currentVal)) {
        if(type == 'minus') {
              if(currentVal > input.attr('data-min')) {
                input.val(currentVal - 1).change();
                /**minus****/
                if (fieldName == 'txtTravellersBtm' || fieldName == 'txtAdultsBtm' || fieldName == 'txtChildBtm' || fieldName == 'txtOtherBtm') {

                        if(plan  == 'family')
                        {   
                              var family_btm_count =  parseInt($('#family_btm_count').val());
                              var total_people_btm =  family_btm_count - 1;
                              $('#family_btm_count').val(total_people_btm);
                              document.getElementById("lblCountBtm").innerHTML = total_people_btm + " Traveller(s)";
                              document.getElementById("lblPeopleBtm").innerHTML = total_people_btm;
                              label.html(input.val());
                        }else
                        {
                               document.getElementById("lblCountBtm").innerHTML = input.val() + " Traveller(s)";
                               document.getElementById("lblPeopleBtm").innerHTML = input.val();
                               label.html(input.val());
                        }

                        var startDate = new Date($('#dp5').datepicker("getDate").valueOf());
                        var endDate = new Date($('#dp6').datepicker("getDate").valueOf());
                        document.getElementById("lblDaysBtm").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);
                        document.getElementById("divPersonsBtm").style.visibility = "visible";
                    }
                else if (fieldName == "txtTravellersMob" || fieldName == 'txtAdultsMob' || fieldName == 'txtChildMob' || fieldName == 'txtOtherMob') {

                       /* mobile spinner */
                        if(plan  == 'family')
                        {   
                              var family_mob_count =  parseInt($('#family_mob_count').val());
                              var total_people_mob =  family_mob_count - 1;
                              $('#family_mob_count').val(total_people_mob);
                              document.getElementById("lblCountMob").innerHTML = total_people_mob + " Traveller(s)";
                              document.getElementById("lblPeopleMob").innerHTML = total_people_mob;
                              label.html(input.val());
                        }else
                        {
                            document.getElementById("lblCountMob").innerHTML = input.val() + " Traveller(s)";
                            document.getElementById("lblPeopleMob").innerHTML = input.val();
                            label.html(input.val());
                        }

                        var startDate = new Date($('#dp3').datepicker("getDate").valueOf());
                        var endDate = new Date($('#dp4').datepicker("getDate").valueOf());
                        document.getElementById("lblDaysMob").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);
                        document.getElementById("divPersonsMob").style.visibility = "visible";
                    }
                    else {
                        /* desktop spinner */

                        if(plan  == 'family')
                        {
                            var family_desk_count =  parseInt($('#family_desk_count').val());
                            var total_people =  family_desk_count - 1;
                            
                            $('#family_desk_count').val(total_people);
                            document.getElementById("lblCountDesk").innerHTML = total_people + " Traveller(s)";
                            document.getElementById("lblPeopleDesk").innerHTML = total_people;
                            label.html(input.val());
                        }else
                        {
                            document.getElementById("lblCountDesk").innerHTML = input.val() + " Traveller(s)";
                            document.getElementById("lblPeopleDesk").innerHTML = input.val();
                            label.html(input.val());
                        }

                        var startDate = new Date($('#dp1').datepicker("getDate").valueOf());
                        var endDate = new Date($('#dp2').datepicker("getDate").valueOf());
                        document.getElementById("lblDaysDesk").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);
                        document.getElementById("divPersonsDesk").style.visibility = "visible";
                    }
                

            } 
            if(parseInt(input.val()) == input.attr('data-min')) {
                $(this).attr('disabled', false);
            }

        } else if(type == 'plus') {

            if(currentVal < input.attr('data-max') ) {
              
              var inc = true;
              if(plan == 'family'){
                if (fieldName == 'txtTravellersBtm' || fieldName == 'txtAdultsBtm' || fieldName == 'txtChildBtm' || fieldName == 'txtOtherBtm') {
                  inc = parseInt($("input[id='txtAdultsBtm']").val()) + parseInt($("input[id='txtChildBtm']").val()) + parseInt($("input[id='txtOtherBtm']").val()) > 14 ? false :true;
                    console.log("bottoms "+parseInt($("input[id='txtAdultsBtm']").val()) + parseInt($("input[id='txtChildBtm']").val()) + parseInt($("input[id='txtOtherBtm']").val()))
                }
                else if (fieldName == "txtTravellersMob" || fieldName == 'txtAdultsMob' || fieldName == 'txtChildMob' || fieldName == 'txtOtherMob') {
                  inc = parseInt($("input[id='txtAdultsMob']").val()) + parseInt($("input[id='txtChildMob']").val()) + parseInt($("input[id='txtOtherMob']").val()) > 14 ? false :true;
                    
                }
                else{
                  inc = parseInt($("input[id='txtAdultsDesk']").val()) + parseInt($("input[id='txtChildDesk']").val()) + parseInt($("input[id='txtOtherDesk']").val()) > 14 ? false :true;
                }
                
              }
              
              
              
              if(inc){
                input.val(currentVal + 1).change();
                var cval = currentVal + 1;
              
                  
                    /** Plus */
                if (fieldName == 'txtTravellersBtm' || fieldName == 'txtAdultsBtm' || fieldName == 'txtChildBtm' || fieldName == 'txtOtherBtm') {

                        if(plan  == 'family')
                        {   
                              var family_btm_count =  parseInt($('#family_btm_count').val());
                              var total_people_btm =  family_btm_count + 1;
                              $('#family_btm_count').val(total_people_btm);

                               document.getElementById("lblCountBtm").innerHTML = total_people_btm + " Traveller(s)";
                               document.getElementById("lblPeopleBtm").innerHTML = total_people_btm;
                               label.html(input.val());
                        }else
                        {
                               document.getElementById("lblCountBtm").innerHTML = input.val() + " Traveller(s)";
                               document.getElementById("lblPeopleBtm").innerHTML = input.val();
                               label.html(input.val());
                        }

                        var startDate = new Date($('#dp5').datepicker("getDate").valueOf());
                        var endDate = new Date($('#dp6').datepicker("getDate").valueOf());
                        document.getElementById("lblDaysBtm").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);
                        document.getElementById("divPersonsBtm").style.visibility = "visible";

                } else if (fieldName == "txtTravellersMob" || fieldName == 'txtAdultsMob' || fieldName == 'txtChildMob' || fieldName == 'txtOtherMob') {
                        /* mobile spinner */
                        if(plan  == 'family')
                        {   
                              var family_mob_count =  parseInt($('#family_mob_count').val());
                              var total_people_mob =  family_mob_count + 1;
                              $('#family_mob_count').val(total_people_mob);
                              document.getElementById("lblCountMob").innerHTML = total_people_mob + " Traveller(s)";
                              document.getElementById("lblPeopleMob").innerHTML = total_people_mob;
                              label.html(input.val());
                        }else
                        {
                               document.getElementById("lblCountMob").innerHTML = input.val() + " Traveller(s)";
                               document.getElementById("lblPeopleMob").innerHTML = input.val();
                               label.html(input.val());
                        }

                     
                        var startDate = new Date($('#dp3').datepicker("getDate").valueOf());
                        var endDate = new Date($('#dp4').datepicker("getDate").valueOf());
                        document.getElementById("lblDaysMob").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);
                        document.getElementById("divPersonsMob").style.visibility = "visible";
                    }
                    else {

                        /* desktop spinner */

                        if(plan  == 'family')
                        {
                              //GET VALUE OF 
                          var family_desk_count =  parseInt($('#family_desk_count').val());
                           var total_people =  family_desk_count + 1;
                           $('#family_desk_count').val(total_people);
                           document.getElementById("lblCountDesk").innerHTML = total_people + " Traveller(s)";
                           document.getElementById("lblPeopleDesk").innerHTML = total_people;
                           label.html(input.val());

                        }else
                        {
                              document.getElementById("lblCountDesk").innerHTML = input.val() + " Traveller(s)";
                              document.getElementById("lblPeopleDesk").innerHTML = input.val();
                              label.html(input.val());
                        }

                        var startDate = new Date($('#dp1').datepicker("getDate").valueOf());
                        var endDate = new Date($('#dp2').datepicker("getDate").valueOf());
                        document.getElementById("lblDaysDesk").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);
                        document.getElementById("divPersonsDesk").style.visibility = "visible";
                    }
               
                

              }

            }
            if(parseInt(input.val()) == input.attr('data-max')) {
                $(this).attr('disabled', false);
            }

        }
    } else {
        input.val(0);
    }
});
$('.number-spinner input[data-min][data-max]').focusin(function(){
  $(this).data('oldValue', $(this).val());
});
$('.number-spinner input[data-min][data-max]').change(function() {    
    minValue =  parseInt($(this).attr('data-min'));
    maxValue =  parseInt($(this).attr('data-max'));
    valueCurrent = parseInt($(this).val());
    
    name = $(this).attr('id');
    if(valueCurrent >= minValue) {
        $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the minimum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    if(valueCurrent <= maxValue) {
        $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the maximum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    
    
});
$(".input-number").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
             // Allow: Ctrl+A
            (e.keyCode == 65 && e.ctrlKey === true) || 
             // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
}); 