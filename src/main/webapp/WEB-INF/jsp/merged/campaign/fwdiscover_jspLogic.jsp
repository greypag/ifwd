<%
	int hotelVoucherCampaignId = Integer.parseInt(session.getAttribute("hotelVoucherCampaignId").toString());
	java.text.SimpleDateFormat cformat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	long cCurrent = System.currentTimeMillis();

	if (request.getParameter("hid")!=null && ((String)request.getParameter("hid")).length() > 0) {
		hotelVoucherCampaignId = Integer.parseInt((String)request.getParameter("hid"));
		if (hotelVoucherCampaignId == -1) {
			cCurrent = cformat.parse("2016-05-01 00:00:00").getTime();
		} else {
			cCurrent = cformat.parse("2016-04-21 00:00:00").getTime();
		}
	}

	if (request.getParameter("month")!=null && ((String)request.getParameter("month")).length() > 0) {
		int month = Integer.parseInt((String)request.getParameter("month"));
		if (month == 7) {
			cCurrent = cformat.parse("2016-07-31 14:59:59").getTime();
		} else {
			cCurrent = cformat.parse("2016-07-31 15:00:00").getTime();
		}
	}

    //hotel monthly campiagn display end time
    long hotelcEnd = cformat.parse("2016-04-30 14:59:59").getTime();
    //hotel monthly campiagn display end time
    long hotelcStart = cformat.parse("2016-04-20 15:00:00").getTime();
    //GI monthly campiagn display end time
    long cStart = cformat.parse("2016-07-31 14:59:59").getTime();
    //cCurrent =  cformat.parse("2016-08-30 15:59:59").getTime();
    /* For Debug and test the campaign switching logic
    set hotelVoucherCampaignId to -1 and cCurrent day <= 18 14:59:59 for the case between GI product paused and not yet start Hotel Voucher
    set hotelVoucherCampaignId to 14,15,16,17,18 and cCurrent day >=18 15:00:00 for the speific day of the hotel voucher
    */
    //hotelVoucherCampaignId = 14;

    String disableOfferClass = "";
    String countDownDate = "";
    String countDownDD = "";
    String countDownMM = "";
    String countDownDate_special = "2016-05-21 14:59:59";
    String countDownDate_regular = "2016-07-31 14:59:59";
    String countDownDate_regular2 = "2016-06-30 14:59:59";
    String lang = UserRestURIConstants.getLanaguage(request);
    String offerCountDownLabel = WebServiceUtils.getMessage("Fanfare.landingpage.timerword", lang);
    boolean isRegPromo = true;
    boolean isRegSpecial = false;
    if( cCurrent <= hotelcEnd && cCurrent >= hotelcStart && (hotelVoucherCampaignId != -1 || hotelVoucherCampaignId == -1)){
    	isRegPromo = false;
    	switch(hotelVoucherCampaignId){
    		case 14:
    	        countDownDate = "2016-04-21 14:59:59";
            	countDownDD = "21";
            	countDownMM = "Apr";
            	break;
    		case 15:
    	        countDownDate = "2016-04-22 14:59:59";
            	countDownDD = "22";
            	countDownMM = "Apr";
            	break;
    		case 16:
    	        countDownDate = "2016-04-23 14:59:59";
            	countDownDD = "23";
            	countDownMM = "Apr";
            	break;
    		case 17:
    	        countDownDate = "2016-04-24 14:59:59";
            	countDownDD = "24";
            	countDownMM = "Apr";
            	break;
    		case 18:
    	        countDownDate = "2016-04-30 14:59:59";
            	countDownDD = "30";
            	countDownMM = "Apr";
            	break;
    		case -1:
    	        countDownDate = "2016-04-30 14:59:59";
            	countDownDD = "30";
            	countDownMM = "Apr";
            	break;
    	}
    } else {
        //Regular Offer Period
        countDownDate = countDownDate_regular;
        countDownDD = "31";
        countDownMM = "July";

        //Special Offer Period
        if(cCurrent >= cformat.parse("2016-05-20 00:00:00").getTime() && cCurrent <= cformat.parse("2016-05-21 14:59:59").getTime() && request.getParameter("regular")==null){
        	isRegSpecial = true;
    		countDownDate = countDownDate_special;
            countDownDD = "21";
            countDownMM = "May";
        }else if(cCurrent >= cformat.parse("2016-05-21 15:00:00").getTime() && cCurrent <= cformat.parse("2016-05-31 14:59:59").getTime() && request.getParameter("regular")==null){
            isRegSpecial = true;
            countDownDate = countDownDate_regular;
            countDownDD = "31";
            countDownMM = "May";
        }else if(cCurrent >= cformat.parse("2016-05-31 15:00:00").getTime() && cCurrent <= cformat.parse("2016-06-31 14:59:59").getTime() && request.getParameter("regular")==null){
            isRegSpecial = false;
            countDownDate = countDownDate_regular2;
            countDownDD = "30";
            countDownMM = "June";
        }

        //Regular Offer ends Period
    	if(cCurrent > cStart /* ||
           (cCurrent >= cformat.parse("2016-05-20 00:00:00").getTime() && cCurrent < cformat.parse("2016-05-21 15:00:00").getTime()) ||
           (cCurrent >= cformat.parse("2016-05-31 00:00:00").getTime() && cCurrent < cformat.parse("2016-05-31 15:00:00").getTime()) */
           /*&& cCurrent < hotelcStart*/){
    		disableOfferClass = "paused-plan";
            /*countDownDate = "2016-05-31 11:59:59";
            countDownDD = "15";
            countDownMM = "May";*/
    	}
    }
%>
