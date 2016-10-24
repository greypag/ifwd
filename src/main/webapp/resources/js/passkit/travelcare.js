/* jshint strict: true */
/* globals $ jQuery */

//debug function
$(function () {
  'use strict';

  function qs(key) {
    key = key.replace(/[*+?^$.\[\]{}()|\\\/]/g, "\\$&"); // escape RegEx meta chars
    var match = location.search.match(new RegExp("[?&]" + key + "=([^&]+)(&|$)"));
    return match && decodeURIComponent(match[1].replace(/\+/g, " "));
  }
  var policyNo = qs('debugPolicyNo');
  if (policyNo) {
    $('#tbx-policy-no').val(policyNo);
  }
});
//debug function end

(function ($, window, undefined) {
  'use strict';

  var USER_TYPE = {
    APPLICANT: 'applicant',
    INSURED_PERSON: 'insuredperson'
  };

  var PAGE_NAME = {
    VERIFY_FORM: 'verify-form',
    VERIFY_EXPIRED: 'verify-expired',
    VERIFY_SYSTEM_ERROR: 'verify-system-error',
    VERIFY_QR_CODE: 'verify-qr-code'
  };

  var RESULT_CODE = {
    MISISNG_ROLE_INFO: 'MISISNG_ROLE_INFO',
    MISSING_APPLICANT_INFO: 'MISSING_APPLICANT_INFO',
    MISSING_INSURED_INFO: 'MISSING_INSURED_INFO',
    POLICY_EXPIRED: 'POLICY_EXPIRED',
    INVALID_APPLICANT_HKID: 'INVALID_APPLICANT_INFO',
    INVALID_INSURED_HKID: 'INVALID_INSURED_INFO',
    PASSKIT_SYSTEM_ERROR: 'PASSKIT_SYSTEM_ERROR',
    PASSKIT_SYSTEM_TIMEOUT: 'PASSKIT_SYSTEM_TIMEOUT',
    PASSKIT_GENERATED: 'PASSKIT_GENERATED'
  };

  $.fn.extend({
    showError: function (msg) {
      return this.each(function () {
        $(this).show();
        $(this).text(msg);
      });
    }
  });

  function clearError() {
    $('.verify-error').text(null).hide();
  }

  function loading(func) {
    $('.loading-container, .loading').show();
    return func.apply(null, []).always(function () {
      $('.loading-container, .loading').hide();
    });
  }

  function showPage(name) {
    $('.tabbed-page').hide();
    $('.tabbed-page.' + name).show();
  }

  function checkPolicyExpiry() {
    loading(function () {
      var $policyNo = $('#tbx-policy-no');
      return $.get('/api/passkit/policies/validate', {
        policyNo: $policyNo.val().trim()
      }).done(function (data) {
        if (data.valid) {
          showPage(PAGE_NAME.VERIFY_FORM);
        } else {
          showPage(PAGE_NAME.VERIFY_EXPIRED);
        }
      }).fail(function (err) {
        console.log(err);
        showPage(PAGE_NAME.VERIFY_SYSTEM_ERROR);
      });
    });
  }

  function goPasskitUrl(policyNo) {
    loading(function () {
      return $.post('/api/passkit/travelCare', {
        policyNo: policyNo
      }).done(function (data) {
        console.log('redirect to passkit url %s', data.url);
        window.location = data.url;
      }).fail(function (err) {
        console.log(err);
        showPage(PAGE_NAME.VERIFY_SYSTEM_ERROR);
      });
    });
  }

  function submitPolicyDetail(userType, hkid, policyNo) {
    loading(function () {
      return $.get('/api/passkit/policies/policiesHolder/validate', {
        policyNo: policyNo,
        hkId: hkid,
        role: userType === USER_TYPE.APPLICANT ? 'A' : 'I'
      }).done(function (data) {
        if (data.valid) {
          switch (data.code) {
            case RESULT_CODE.MISISNG_ROLE_INFO:
            case RESULT_CODE.MISSING_APPLICANT_INFO:
            case RESULT_CODE.MISSING_INSURED_INFO:
              break;
            case RESULT_CODE.POLICY_EXPIRED:
              showPage(PAGE_NAME.VERIFY_EXPIRED);
              break;
            case RESULT_CODE.INVALID_APPLICANT_HKID:
            case RESULT_CODE.INVALID_INSURED_HKID:
              var $error = $('.verify-error[data-error-for="tbx-' + userType + '-hkid"]');
              $error.showError($error.data('errorValidate'));
              break;
            case RESULT_CODE.PASSKIT_SYSTEM_ERROR:
            case RESULT_CODE.PASSKIT_SYSTEM_TIMEOUT:
              showPage(PAGE_NAME.VERIFY_SYSTEM_ERROR);
              break;
            case RESULT_CODE.PASSKIT_GENERATED:
              goPasskitUrl(policyNo);
              break;
            default:
              console.log('Unknown result code: %s', data.code);
              break;
          }
        }
      }).fail(function (err) {
        console.log(err);
        showPage(PAGE_NAME.VERIFY_SYSTEM_ERROR);
      });
    });
  }

  $(function () {
    $('.verify-textfield').blur(function () {
      $(this).val($(this).val().toUpperCase());
    });

    $('.verify-form input[type="radio"]').change(function () {
      $('.verify-form input[type="radio"]:not(:checked)').parents('.verify-option').removeClass('active');
      $(this).parents('.verify-option').addClass('active');

      var userType = this.value;
      $('.verify-detail[data-type!=' + userType + ']').removeClass('expanded');
      $('.verify-detail[data-type=' + userType + ']').addClass('expanded');

      $('html, body').animate({
        scrollTop: $(".verify-content").offset().top - 20
      }, 500);

      $('.verify-action').show();
      clearError();
    });

    $('#tbx-verify-submit').click(function (e) {
      e.preventDefault();
      clearError();
      var userType = $('.verify-form input[name="usertype"]:checked').val();
      if (userType) {
        var key = 'tbx-' + userType + '-hkid';
        var $hkid = $('#' + key);
        var $error = $('.verify-error[data-error-for="' + key + '"]');
        var hkid = $hkid.val().trim();
        if (hkid) {
          if (/^[a-zA-Z]{1,2}\d{3,4}$/.exec(hkid) && /^[a-zA-Z0-9]{5}$/.exec(hkid)) {
            submitPolicyDetail(userType, hkid, $('#tbx-policy-no').val().trim());
          } else {
            $hkid.focus();
            $error.showError($error.data('errorValidate'));
          }
        } else {
          $hkid.focus();
          $error.showError($error.data('errorRequired'));
        }
      }
    });

    checkPolicyExpiry();

    // var mobile = (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0, 4)));
    // if (!mobile) {
    //   showPage(PAGE_NAME.VERIFY_QR_CODE);
    // } else {
    // }
  });


})(jQuery, window);