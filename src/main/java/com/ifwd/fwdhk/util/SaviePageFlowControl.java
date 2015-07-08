package com.ifwd.fwdhk.util;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class SaviePageFlowControl {
	
	private final static Logger logger = LoggerFactory.getLogger(SaviePageFlowControl.class);
	
	public static String pageFlow(HttpServletRequest request)
	{		
		
		
/*		
		savie-landing
		savie-plan-details
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
		current : /tc/savie-plan-details

*/
		
		
	
		
		String referer = request.getHeader("referer");
		String current = request.getServletPath();
		//logger.info("referer : "+referer);
		//logger.info("current : "+current);	
		if(referer!=null)
		{
			referer=referer.substring(referer.lastIndexOf("/")+1);
		}
		
		if(current!=null)
		{
			current=current.substring(current.lastIndexOf("/")+1);
		}
		
		logger.info("referer : "+referer);
		logger.info("current : "+current);

        
	    
	    String to="";
		if (current.equals("savie-plan-details")) 
		{
			if(referer==null)
			{
				to="savie-landing";
			}
			else if (referer.endsWith("savie-landing")) 
			{
				to="savie-application-details";
			} 
			else if(referer.endsWith("savie-edit-view")) 
			{
				to="savie-edit-view";
			}			
		}		
		
		if (current.equals("savie-fna")) 
		{
			if(referer==null)
			{
				to="savie-landing";
			}
			else if (referer.endsWith("savie-plan-details")) 
			{
				to="savie-application-details";
			} 
			else if(referer.endsWith("savie-edit-view")) 
			{
				to="savie-edit-view";
			}			
		}

		
		if (current.equals("savie-application-details")) 
		{
			if(referer==null)
			{
				to="savie-landing";
			}
			else if (referer.endsWith("savie-fna")) 
			{
				to="savie-order-summary";
			} 
			else if(referer.endsWith("savie-edit-view")) 
			{
				to="savie-edit-view";
			}			
		}
		
		if (current.equals("savie-order-summary")) 
		{
			if(referer==null)
			{
				to="savie-landing";
			}
			else if (referer.endsWith("savie-application-details")) 
			{
				to="savie-appointment";
			} 
			else if(referer.endsWith("savie-edit-view")) 
			{
				to="savie-edit-view";
			}			
		}
		
		if (current.equals("savie-appointment")) 
		{
			if(referer==null)
			{
				to="savie-landing";
			}
			else if (referer.endsWith("savie-order-summary")) 
			{
				to="savie-document-upload";
			} 
			else if(referer.endsWith("savie-edit-view")) 
			{
				to="savie-edit-view";
			}			
		}
		
		if (current.equals("savie-document-upload")) 
		{
			if(referer==null)
			{
				to="savie-landing";
			}
			else if (referer.endsWith("savie-appointment")) 
			{
				to="savie-thankyou";
			} 
			else if(referer.endsWith("savie-edit-view")) 
			{
				to="savie-edit-view";
			}			
		}
		
		
		if (current.equals("savie-thankyou")) 
		{
			if(referer==null)
			{
				to="savie-landing";
			}
			else if (referer.endsWith("savie-document-upload")) 
			{
				to="savie-declaration-authorization";
			} 
			else if(referer.endsWith("savie-edit-view")) 
			{
				to="savie-edit-view";
			}			
		}
		
		if (current.equals("savie-declaration-authorization")) 
		{
			if(referer==null)
			{
				to="savie-landing";
			}
			else if (referer.endsWith("savie-thankyou")) 
			{
				to="savie-signature";
			} 
			else if(referer.endsWith("savie-edit-view")) 
			{
				to="savie-edit-view";
			}			
		}
		
		if (current.equals("savie-signature")) 
		{
			if(referer==null)
			{
				to="savie-landing";
			}
			else
			{
				to="savie-edit-view";
			}			
		}

		
		logger.info("to : "+to);
		
		return to; 
		
	}
		
	
	
}
