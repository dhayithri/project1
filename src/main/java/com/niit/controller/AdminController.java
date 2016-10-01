package com.niit.controller;

/******
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;
import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;

@Controller
public class AdminController {
	
	@Autowired
	private Product product;
	@Autowired
	private Supplier supplier;
	@Autowired
	private Category category;
	@Autowired
	private SupplierDAO supplierDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping("/manageCategories")
	public ModelAndView categories(){
		ModelAndView mv= new ModelAndView("/Home");
		mv.addObject("category",category);
		mv.addObject("isAdminClickedCategories","true");
		mv.addObject("categoryList",categoryDAO.list());
		return mv;	
	}
	@RequestMapping("/manageProducts")
	public ModelAndView products(){
		ModelAndView mv= new ModelAndView("/Home");
		mv.addObject("product",product);
		mv.addObject("isAdminClickedProducts","true");
		mv.addObject("productList",productDAO.list());
		return mv;
	}
	@RequestMapping("/manageSuppliers")
	public ModelAndView suppliers(){
		ModelAndView mv= new ModelAndView("/Home");
		mv.addObject("supplier",supplier);
		mv.addObject("isAdminClickedSuppliers","true");
		mv.addObject("supplierList",supplierDAO.list());
		return mv;
	}
	
}***/


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.UserDetailsDAO;

@Controller
public class AdminController {
	@Autowired 
	UserDetailsDAO userDetailsDAO;
	@RequestMapping(value ="/Admin" )
	public ModelAndView SupplierPage() {
		ModelAndView mv= new ModelAndView("/Admin");
		mv.addObject("UserClickedadmin", "true");
		return mv;
}
	/****@RequestMapping(value = "/login_session_attributes")
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
		    	 return "/Home";
		     }
		     else 
		     {
		    	 session.setAttribute("Administrator", "true");
			 return "/Admin";
		     }
	}
		return "/Home";
	
	}***/

}


