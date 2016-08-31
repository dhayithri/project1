package com.niit.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.model.Product;
import com.niit.shoppingcart.dao.ProductDAO;

@Controller
public class ProductController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	Product product;
	
	@RequestMapping(value="addproduct")
	public String addproduct(@ModelAttribute("product")Product product,Model m){
		
		productDAO.save(product);
		m.addAttribute("msg", "hello");
		return "Home";
	}
	
	@RequestMapping(value="updateproduct")
	public String updateproduct(@ModelAttribute("product")Product product,Model m)
	{
		productDAO.update(product);
		m.addAttribute("msg", "hello");
		return "Home";
	}
	@RequestMapping(value="deleteproduct")
	public String deleteproduct(@ModelAttribute("product")Product product,Model m)
	{
		productDAO.delete(product);
		m.addAttribute("msg", "hello");
		return "Home";
	}
	
	@RequestMapping("Product")
	public ModelAndView product(){
		ModelAndView mv=new ModelAndView("/Product");
	    mv.addObject("productList", productDAO.list());
		mv.addObject("product",new Product());
		mv.addObject("UserClickedproduct",true);
		return mv;
	}
}
