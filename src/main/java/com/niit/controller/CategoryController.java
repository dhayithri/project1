package com.niit.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.model.Category;
import com.niit.shoppingcart.dao.CategoryDAO;



@Controller
public class CategoryController {
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	Category category ;
		
	@RequestMapping(value="addcategory")
	public String addcategory(@ModelAttribute("category")Category category,Model m)
	{
		categoryDAO.save(category);
		m.addAttribute("msg", "hello");
		return "Home";
	}
	@RequestMapping(value="updatecategory")
	public String updatecategory(@ModelAttribute("category")Category category,Model m)
	{
		categoryDAO.update(category);
		m.addAttribute("msg", "hello");
		return "Home";
	}
	@RequestMapping(value="deletecategory")
	public String deletecategory(@ModelAttribute("category")Category category,Model m)
	{
		categoryDAO.delete(category);
		m.addAttribute("msg", "hello");
		return "Home";
	}
	
	@RequestMapping("Category")
	public ModelAndView category(){
		ModelAndView mv=new ModelAndView("/Category");
	mv.addObject("categoryList", categoryDAO.list());
		mv.addObject("category",new Category());
		mv.addObject("UserClickedcategory",true);
		return mv;
	}
}
