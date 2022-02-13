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

@Controller
@Transactional
public class ProductsController {

	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping(value = "/produtos/form", method = RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types", BookType.values());
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/produtos", method = RequestMethod.POST)
	public String save(Product product) {
		productDAO.save(product);
		System.out.println("Cadastrado novo produto: " + product);
		
		return "products/ok";
	}
	
	@RequestMapping(value = "/produtos", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products", productDAO.list());
		
		return modelAndView;
	}
	
}
