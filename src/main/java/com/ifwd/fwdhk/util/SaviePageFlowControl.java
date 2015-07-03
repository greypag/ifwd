package com.ifwd.fwdhk.util;


import javax.servlet.http.HttpServletRequest;

import com.ifwd.fwdhk.controller.UserRestURIConstants;





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
		if(referer!=null)
		{
			referer=referer.substring(referer.lastIndexOf("/")+1);
		}
		
		if(current!=null)
		{
			current=current.substring(current.lastIndexOf("/")+1);
		}
		
		System.out.println("referer : "+referer);
		System.out.println("current : "+current);

        
	    
	    String to="";
		if (current.equals("savie-sales-illustration")||current.equals("savie-illustration")) 
		{
			if(referer==null)
			{
				to="savie-landing";
			}
			else if (referer.endsWith("savie-landing")) 
			{
				to="savie-application-detail1";
			} 
			else if(referer.endsWith("savie-edit-view")) 
			{
				to="savie-edit-view";
			}			
		}

		
		System.out.println("to : "+to);
		
		return to; 
		
	}
		
	
	
}
