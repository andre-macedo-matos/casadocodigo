package org.casadocodigo.controllers;

import javax.transaction.Transactional;

import org.casadocodigo.daos.ProductDAO;
import org.casadocodigo.loja.models.BookType;
import org.casadocodigo.loja.models.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Transactional
@RequestMapping("/produtos")
public class ProductsController {

	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types", BookType.values());
		
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String save(Product product, RedirectAttributes redirectAttributes) {
		productDAO.save(product);
		System.out.println("Cadastrado novo produto: " + product);
		
		redirectAttributes.addFlashAttribute("sucesso", "Produto Cadastrado com Sucesso!!!");
		
		return "redirect:produtos";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products", productDAO.list());
		
		return modelAndView;
	}
	
}
