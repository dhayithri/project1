package com.niit.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.model.Supplier;
import com.niit.shoppingcart.dao.SupplierDAO;


@Controller
public class SupplierController {
	@Autowired
	SupplierDAO supplierDAO;
	@Autowired
	Supplier supplier ;
	/**
	  @RequestMapping(value="Supplier")
	public String supplier(Model mv){
	
		mv.addAttribute("supplier", new Supplier());
		mv.addAttribute("UserClickedsupplier","true");
		return "Home";  **/
		
	@RequestMapping(value="addsupplier")
	public String addsupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
	{
		supplierDAO.save(supplier);
		m.addAttribute("msg", "hello");
		return "Home";
	}
	@RequestMapping(value="updatesupplier")
	public String updatesupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
	{
		supplierDAO.update(supplier);
		m.addAttribute("msg", "hello");
		return "Home";
	}
	@RequestMapping(value="deletesupplier")
	public String deletesupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
	{
		supplierDAO.delete(supplier);
		m.addAttribute("msg", "hello");
		return "Home";
	}
	
	@RequestMapping("Supplier")
	public ModelAndView supplier(){
		ModelAndView mv=new ModelAndView("/Supplier");
	mv.addObject("supplierList", supplierDAO.list());
		mv.addObject("supplier",new Supplier());
		mv.addObject("UserClickedsupplier",true);
		return mv;
	}
}
