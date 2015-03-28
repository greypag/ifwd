package com.ifwd.fwdhk.util;

public class DateApi {
	public String pickDate(String pickDate){
		
		String getDate[] = pickDate.split(" ");
		String month = getDate[1];
		String m="00";
		
		switch (month)
		{
		
		
	    case "January" :
	    				m="01";
	                  break;

	    case "February" :
	    				m="02";
	                  break;

	    case "March" :
	    				m="03";
	                  break;

	    case "April" :
	    				m="04";
	                  break;

	    case "May" :
	    				m="05";
	                  break;

	    case "June" :
	    				m="06";
	                  break;

	    case "July" :
	    				m="07";
	                  break;

	    case "August" :
	    				m="08";
	                  break;
		

	    case "September" :
	    				m="09";
	                  break;
		

	    case "October" :
	    				m="10";
	                  break;
	    case "November" :
						m="11";
						break;
	    
	    case "December" :
						m="12";
						break;
	                
	       }
	
//		String formatedDate=getDate[0]+"/"+m+"/"+getDate[2];
		String formatedDate=getDate[2]+"-"+m+"-"+getDate[0];
		System.out.println(formatedDate +" formatedDate");
		return formatedDate;
		
		}
}
