package com.ifwd.fwdhk.util;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;




public class SaviePageFlowControl {

	@SuppressWarnings("null")
	public static ModelAndView pageFlow(HttpServletRequest request, HttpServletResponse response, String current, String from) throws IOException 
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

		*/
		
        
	    
	    String to="";
		if (current.equals("savie-sales-illustration")) 
		{
			if (from.equals("savie-landing")) 
			{
				to="savie-fna";
			} 
			else if(from.equals("savie-edit-view")) 
			{
				to="savie-edit-view";
			}
			else if(from.equals("error"))
			{
				response.sendError(HttpServletResponse.SC_BAD_REQUEST);
				return null;
			}
		}
		
		return new ModelAndView("redirect:" + to);
		
	}
		
	
	
}
