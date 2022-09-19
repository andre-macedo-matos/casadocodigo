package org.casadocodigo.controllers;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.casadocodigo.daos.ProductDAO;
import org.casadocodigo.loja.infra.FileSaver;
import org.casadocodigo.loja.models.BookType;
import org.casadocodigo.loja.models.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Transactional
@RequestMapping("/produtos")
public class ProductsController {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public ModelAndView form(Product product) {
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types", BookType.values());
		
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	@CacheEvict(value = "books", allEntries = true)
	public ModelAndView save(MultipartFile summary, @Valid Product product, BindingResult bindingResult, 
							 RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors()) 
			return form(product);

		productDAO.save(product);
		String webPath = fileSaver.write("casadocodigo", summary);
		product.setSummaryPath(webPath);
		System.out.println("Cadastrado novo produto: " + product);
		
		redirectAttributes.addFlashAttribute("sucesso", "Produto Cadastrado com Sucesso!!!");
		
		return new ModelAndView("redirect:produtos");
	}
	
	@RequestMapping(method = RequestMethod.GET)
	@Cacheable(value = "books")
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products", productDAO.list());
		
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/show/{id}")
	public ModelAndView show(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("products/show");
		
		Product product = productDAO.find(id);
		modelAndView.addObject(product);
		
		return modelAndView;
	}
	
}
