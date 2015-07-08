package com.ifwd.fwdhk.util;


import javax.servlet.http.HttpServletRequest;





public class SaviePageFlowControl {

	public static String pageFlow(HttpServletRequest request)
	{		
		
		
/*		
		savie-landing
		savie-sales-illustration
		savie-fna
		savie-application-details
		savie-order-summary
		savie-appointment
		savie-document-upload
		savie-thankyou
		savie-declaration-authorization
		savie-signature
		savie-edit-view


referer : http://localhost:8080/FWDHKPH1A/tc/savie-landing
current : /tc/savie-illustration

		*/
		
		String referer = request.getHeader("referer");
		String current = request.getServletPath();
		System.out.println("referer : "+referer);
		System.out.println("current : "+current);	
		if(!referer.isEmpty())
		{
			referer=referer.substring(referer.lastIndexOf("/")+1);
		}
		
		if(!current.isEmpty())
		{
			current=current.substring(current.lastIndexOf("/")+1);
		}
		
		System.out.println("referer : "+referer);
		System.out.println("current : "+current);

        
	    
	    String to="";
		if (current.equals("savie-sales-illustration")) 
		{
			if(referer.isEmpty())
			{
				to="savie-landing";
			}
			else if (referer.endsWith("savie-landing")) 
			{
				to="savie-fna";
			} 
			else if(referer.endsWith("savie-edit-view")) 
			{
				to="savie-edit-view";
			}			
		}
		
	
		
		return to; 
		
	}
		
	
	
}
