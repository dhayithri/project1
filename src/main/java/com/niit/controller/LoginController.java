package com.niit.controller;

import org.springframework.stereotype.Controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.model.UserDetails;
import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;

@Controller
public class LoginController {

	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	@RequestMapping(value = "Login")
	public String DisplayLogin(Model mv) {
		mv.addAttribute("userDetails", new UserDetails());
		mv.addAttribute("userClickedLoginHere", "true");
		return "Home";
	}
	
	@RequestMapping(value = "Registration")
	public String DisplayRegister(Model mv) {
		mv.addAttribute("userDetails", new UserDetails());
		mv.addAttribute("categoryList", categoryDAO.list());
		mv.addAttribute("productList", productDAO.list());
		mv.addAttribute("userClickedRegistrationHere", "true");
		return "Home";
	}

	@RequestMapping(value = "adduser", method = RequestMethod.POST)
	public String UserRegister(@ModelAttribute("userDetails") UserDetails userDetails, ModelAndView mv) {
		userDetails.setEnabled("TRUE");
		userDetails.setRole("ROLE_USER");
		userDetailsDAO.saveOrUpdate(userDetails);
		mv.addObject("message", "Registration Success");
		return "redirect:/";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/login_session_attributes")
	public String login_session_attributes(HttpSession session) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		UserDetails user = userDetailsDAO.get(username);
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("name", user.getName());
		session.setAttribute("LoggedIn", "true");

		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
		.getAuthentication().getAuthorities();
		String role="ROLE_USER";
		for (GrantedAuthority authority : authorities) 
		{
		  
		     if (authority.getAuthority().equals(role)) 
		     {
		    	 session.setAttribute("UserLoggedIn", "true");
		    	 return "redirect:/";
		     
		     }
		     else 
		     {
		    	 session.setAttribute("Administrator", "true");
			return "/Admin";
		     }
		}
		return "Home";

}
	
	

}
