package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.niit.model.Supplier;
import com.niit.shoppingcart.dao.SupplierDAO;

@Controller
public class SupplierController {
	
	
	@Autowired
	SupplierDAO supplierDAO;
	

	@Autowired
	Supplier supplier ;
	/*@RequestMapping(value="Supplier")
	public String supplier(Model mv)
	{
		mv.addAttribute("supplier", new Supplier());
		mv.addAttribute("UserClickedSupplier","true");
		return "Home";
		
	}*/
	/***@RequestMapping(value="addsupplier")
	public String addsupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
	{
		supplierDAO.save(supplier);
		m.addAttribute("msg", "hello");
		return "redirect:/Supplier";
	}****/
	@RequestMapping(value={"deletesupplier","adddeletesupplier/{id}deletesupplier"})
	public String deletesupplier(@ModelAttribute("supplier2")Supplier supplier,Model m)
	{
		supplierDAO.delete(supplier);
		m.addAttribute("msg", "hello");
		return "redirect:/Supplier";
	}
	
		@RequestMapping(value={"updatesupplier","addupdatesupplier/{id}updatesupplier"})
	    public String updatesupplier(@ModelAttribute("supplier1")Supplier supplier, Model m)
	    {
	    	supplierDAO.update(supplier);
	    	return "redirect:/Supplier";
	    }
		@RequestMapping(value ="Supplier" )
		public ModelAndView SupplierPage(@ModelAttribute("supplier") Supplier supplier,BindingResult result,
				@ModelAttribute("supplier1") Supplier supplier1,BindingResult result1,
				@ModelAttribute("supplier2") Supplier supplier2,BindingResult result2) {
			ModelAndView mv= new ModelAndView("Admin");
			//mv.addObject("supplier", new Supplier());
			mv.addObject("supplierList", supplierDAO.list());
			mv.addObject("UserClickedSupplier", "true");
			return mv;
			
		}
	@RequestMapping(value ={"addupdatesupplier/{id}"} )
	public String SupplierPageupdate(@PathVariable("id") int id,RedirectAttributes attributes) {
		attributes.addFlashAttribute("supplier1", this.supplierDAO.get(id));
		return "redirect:/Supplier";
	}
	@RequestMapping(value ={"adddeletesupplier/{id}"} )
	public String SupplierPagedelete(@ModelAttribute("supplier")Supplier supplier,Model m){
		//attributes.addFlashAttribute("supplier2", this.supplierDAO.get(id));
		supplierDAO.delete(supplier);
		return "redirect:/Supplier";
	}
	   /*  @RequestMapping(value="Supplier")
	    public ModelAndView supplier(ModelAndView mv)
	    {
	    	mv.addObject("supplier", new Supplier());
	    	mv.addObject("supplierList",supplierDAO.list());
	    	mv.addObject("UserClickedsupplier", "true");
	    	return mv;
	}*/
}
