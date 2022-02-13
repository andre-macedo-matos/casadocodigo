package org.casadocodigo.controllers;

import javax.transaction.Transactional;

import org.casadocodigo.daos.ProductDAO;
import org.casadocodigo.loja.models.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Transactional
public class ProductsController {

	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping("/produtos/form")
	public String form() {
		return "products/form";
	}
	
	@RequestMapping("/produtos")
	public String save(Product product) {
		productDAO.save(product);
		System.out.println("Cadastrado novo produto: " + product);
		
		return "products/ok";
	}
	
}
