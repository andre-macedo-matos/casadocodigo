package org.casadocodigo.controllers;

import org.casadocodigo.daos.ProductDAO;
import org.casadocodigo.loja.models.BookType;
import org.casadocodigo.loja.models.Product;
import org.casadocodigo.loja.models.ShoppingCart;
import org.casadocodigo.loja.models.ShoppingItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shopping")
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class ShoppingController {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ShoppingCart shoppingCart;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView add(Integer productId, BookType bookType) {
		ShoppingItem item = createItem(productId, bookType);
		shoppingCart.add(item);
		
		System.out.println(shoppingCart);
		
		return new ModelAndView("redirect:/shopping");
	}

	private ShoppingItem createItem(Integer productId, BookType bookType) {
		Product product = productDAO.find(productId);
		ShoppingItem item = new ShoppingItem(product, bookType);
		
		return item;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String items() {
		return "shoppingCart/items";
	}
	
}
