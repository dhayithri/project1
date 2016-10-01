package com.niit.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.model.Product;
import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;



@Controller
public class HomeController {
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
    
		/***@RequestMapping("/Registration")
		public ModelAndView registration()
		{
			ModelAndView mv= new ModelAndView("Registration");
			mv.addObject("userClickedRegistrationHere","true");
			return mv;
			
	    }
		@RequestMapping("/Login")
		public ModelAndView login()
		{
			ModelAndView mv= new ModelAndView("Login");
			mv.addObject("userClickedLoginHere","true");
			return mv;
			
	    }***/
	    @RequestMapping("/")
	    public String homepage(Model m){
	    	m.addAttribute("product", new Product());
	    	m.addAttribute("categoryList", categoryDAO.list());
	    	m.addAttribute("productList", productDAO.list());
	    	return "Home";
	    }
	    @RequestMapping(value ="ShowProduct/{id}" )
	    public String ShowProduct(@PathVariable("id") int id,RedirectAttributes attributes,Model m) {
	        m.addAttribute("UserClickedshowproduct", "true");
	    	m.addAttribute("IndividualProduct", productDAO.getproduct(id));
	    	return "ShowProduct";
	    }
	   
}