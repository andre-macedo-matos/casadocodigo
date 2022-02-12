package org.casadocodigo.controllers;

import org.casadocodigo.loja.models.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductsController {

	@RequestMapping("/produtos/form")
	public String form() {
		return "products/form";
	}
	
	@RequestMapping("/produtos")
	public String save(Product product) {
		System.out.println("Cadastrado novo produto: " + product);
		return "products/ok";
	}
}
