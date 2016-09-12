package com.niit.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.niit.model.Product;
import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;


@Controller
public class ProductController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	Product product;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	SupplierDAO supplierDAO;
	private Path path;

	@RequestMapping(value="editproduct")
	public String editproduct(@ModelAttribute("product") Product product,HttpServletRequest request,Model m){
		productDAO.update(product);
		MultipartFile file=product.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "\\resources\\images\\"+product.getId()+".jpg");
        if (file != null && !file.isEmpty()) {
            try {
            	System.out.println("Image Saving Start");
            	file.transferTo(new File(path.toString()));
            	System.out.println("Image Saved");
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error");
                throw new RuntimeException("item image saving failed.", e);
            }
        }
		return "redirect:/Product";
}
	
	/**@RequestMapping(value="addproduct")
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
	}**/
	
	@RequestMapping(value={"deleteproduct","adddeleteproduct/{id}deleteproduct"})
	public String deleteproduct(@ModelAttribute("product2")Product product,Model m)
	{
		productDAO.delete(product);
		m.addAttribute("msg", "hello");
		return "redirect:/Product";
	}
	
	@RequestMapping(value={"updateproduct","addupdateproduct/{id}updateproduct"})
    public String updateproduct(@ModelAttribute("product1")Product product, Model m)
    {
    	productDAO.update(product);
    	return "redirect:/Product";
    }
	/***@RequestMapping(value ="Product" )
	public ModelAndView ProductPage(@ModelAttribute("product") Product product,BindingResult result,
			@ModelAttribute("product1") Product product1,BindingResult result1,
			@ModelAttribute("product2") Product product2,BindingResult result2) {
		ModelAndView mv= new ModelAndView("Admin");
		//mv.addObject("product", new Product());
		mv.addObject("productList", productDAO.list());
		mv.addObject("UserClickedProduct", "true");
		return mv;
		
	}**/
	@RequestMapping(value ="Product" )
	public ModelAndView ProductPage(@ModelAttribute("product") Product product,BindingResult result) {
		ModelAndView mv= new ModelAndView("/Admin");
		//mv.addObject("product", new Product());
		mv.addObject("productList", productDAO.list());
		mv.addObject("categoryList",categoryDAO.list());
		mv.addObject("supplierList",supplierDAO.list());
		mv.addObject("UserClickedProduct", "true");
		return mv;
}
@RequestMapping(value ={"addupdateproduct/{id}"} )
public String ProductPageupdate(@PathVariable("id") int id,RedirectAttributes attributes) {
	attributes.addFlashAttribute("product1", this.productDAO.get(id));
	return "redirect:/Product";
}
@RequestMapping(value ={"adddeleteproduct/{id}"} )
public String ProductPagedelete(@ModelAttribute("product")Product product,Model m){
	//attributes.addFlashAttribute("product2", this.productDAO.get(id));
	productDAO.delete(product);
	return "redirect:/Product";
}
  
}
