package com.niit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.model.Category;
import com.niit.shoppingcart.dao.CategoryDAO;


@Controller
public class HomeController {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	
	/*@RequestMapping("/")
	public String homePage()
	{
		return "Home";
	}
	*/
    @RequestMapping("/")
	public ModelAndView home()
	{
    	//log.debug("Starting of the method onLoad");
		ModelAndView mv= new ModelAndView("Home");
		//mv.addObject("message","Thank you for visiting this ShoppingCart");
		//session.setAttribute("category", category);
		//session.setAttribute("categoryList",categoryDAO.list());
		//List<Category> categoryList= categoryDAO.list(); 
		//mv.addObject("categoryList",categoryList);
		//System.out.println("Size:"+ categoryList.size());
		//log.debud("Ending of the method onLoad");
		return mv;
   	}
		@RequestMapping("/Registration")
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
			
	    }
}
