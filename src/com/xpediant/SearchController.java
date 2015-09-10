package com.xpediant;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	   private static final String urlString = "http://localhost:8983/solr/gettingstarted";
	   
	   private HttpSolrServer solrServer;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	   public ModelAndView search() {
	      return new ModelAndView("search", "command", new Search());
	   }
	
	   @RequestMapping(value = "/searchUsers", method = RequestMethod.POST)
	   public String searchUsers(@ModelAttribute Search search, 
	   ModelMap model) throws SolrServerException, IOException {
		   
		    if (solrServer == null) {
			     solrServer = new HttpSolrServer(urlString);
			    }
		   
		    SolrQuery query = new SolrQuery();
		    String fname = "fname:"+search.getFirstName();
		    String gender = "gender:"+search.getGender();
		    String id = "id:"+search.getPassportNumber();

		    query.set("q", fname,gender,id);

		    QueryResponse response = solrServer.query(query);
		    
		    SolrDocumentList list = response.getResults();
	    	  ArrayList<User> usersAl = new ArrayList<>();
		    for (int i = 0; i < list.size(); ++i) {
		    	
				  User user = new User();
			      SolrDocument solrDoc = list.get(i);
			      user = setUserClass(solrDoc,user);
			      usersAl.add(user);

		    }
		    search.setAl(usersAl);
		    
		      model.addAttribute("firstName", search.getFirstName());
		      model.addAttribute("passportNumber", search.getPassportNumber());	
		      model.addAttribute("gender", search.getGender());
		      model.addAttribute("usersAl", usersAl);
		    
		    return "searchResults";
		  }

	private User setUserClass(SolrDocument solrDoc, User user) {
		  
	      String fname = getValue(solrDoc, "fname");	
	      user.setFname(fname);
	      
	      String lname = getValue(solrDoc, "lname");	
	      user.setLname(lname);	 
	      
	      String gender = getValue(solrDoc, "gender");	
	      user.setGender(gender);
	      
	      String fLineAddr = getValue(solrDoc, "fLineAddr");	
	      user.setfLineAddr(fLineAddr);
	      
	      String city = getValue(solrDoc, "city");	
	      user.setCity(city);
	      
	      String state = getValue(solrDoc, "state");	
	      user.setState(state);
	      
	      String country = getValue(solrDoc, "country");	
	      user.setCountry(country);
	      
	      String zipCode = getValue(solrDoc, "zipCode");	
	      user.setZipCode(zipCode);
	      
	      String passportNumber = getValue(solrDoc, "id");	
	      user.setPassportNumber(passportNumber);
	      
	      String dob = getValue(solrDoc, "dob");	
	      user.setDob(dob);
	      
	      String hhi = getValue(solrDoc, "hhi");	
	      user.setHhi(hhi);
		
		return user;
		
	}

	private String getValue(SolrDocument solrDoc, String name) {
		
	      Object obj = solrDoc.getFieldValue(name);
	      String value="";
	      if(null!=obj){
		      value = obj.toString();
		      value = value.replace("[", "");
		      value = value.replace("]", "");
	      }
	      
		return value;
	}
}

