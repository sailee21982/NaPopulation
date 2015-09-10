package com.xpediant;



import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;

import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import javax.servlet.http.Part;

import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.ui.ModelMap;

 
@Controller
public class UserController {
	
	   private static final String urlString = "http://localhost:8983/solr/gettingstarted";
	   
	   private HttpSolrServer solrServer;
	   	   
	   @RequestMapping(value = "/user", method = RequestMethod.GET)
	   public ModelAndView user() {
	      return new ModelAndView("user", "command", new User());
	   }
	   
	   @RequestMapping(value = "/addUser", method = RequestMethod.POST)
	   public String addUser(@ModelAttribute("SpringWeb")User user, 
	   ModelMap model) throws JsonGenerationException, JsonMappingException, IOException {
		   
		   //writeJSONFile(user);
		   writeSolrDocument(user);
		   
	      model.addAttribute("fname", user.getFname());
	      model.addAttribute("lname", user.getLname());	
	      model.addAttribute("gender", user.getGender());
	      model.addAttribute("fLineAddr", user.getfLineAddr());
	      model.addAttribute("city", user.getCity());	
	      model.addAttribute("state", user.getState());
	      model.addAttribute("country", user.getCountry());	
	      model.addAttribute("zipCode", user.getZipCode());
	      model.addAttribute("passportNumber", user.getPassportNumber());
	      model.addAttribute("dob", user.getDob());
    	  String hhi = user.getHhi();
	      if(null!=user.getHhi()){

	    	  switch (hhi) {
	            case "1":  hhi = "Less than $40,000";
	                     break;
	            case "2":  hhi = "$40,000 &#60; $80000";
	                     break;
	            case "3":  hhi = "$80,000 &#60; $100,000";
	                     break;
	            case "4":  hhi = "More than $100,000";

	            default: hhi = "Not Entered";
	                     break;
	        }
	    		  
	      }
	      
	      model.addAttribute("hhi", hhi);	      
	      
	      return "result";
	   }

	private void writeSolrDocument(User user) {
	    if (solrServer == null) {
		     solrServer = new HttpSolrServer(urlString);
		    }
	    SolrInputDocument doc = new SolrInputDocument();
	    doc.addField("id", user.getPassportNumber());
	    doc.addField( "fname", user.getFname());
	    doc.addField( "lname", user.getLname());
	    doc.addField( "gender", user.getGender());
	    doc.addField( "fLineAddr", user.getfLineAddr());
	    doc.addField( "city", user.getCity());
	    doc.addField( "state", user.getState());
	    doc.addField( "country", user.getCountry());
	    doc.addField( "zipCode", user.getZipCode());
	    doc.addField( "dob", user.getDob());
	    doc.addField( "hhi", user.getHhi());
	    
	    try {
	     solrServer.add(doc);
	    } catch (SolrServerException e) {
	     e.printStackTrace();
	    } catch (IOException e) {
	     e.printStackTrace();
	    }
		
	}
	
	private void writeJSONFile(User user) throws JsonGenerationException, JsonMappingException, IOException{
		
		   final String fileName = user.getPassportNumber() + ".json";
		   
		   ObjectMapper mapper = new ObjectMapper();
			
		   mapper.writeValue(new File("/Users/kshitijsubhedar/Documents/workspace/NAPopulation/WebContent/WEB-INF/json/"+fileName), user);
	
	}

}
