package org.casadocodigo.controllers;

import java.math.BigDecimal;

import org.casadocodigo.loja.models.IntegrandoComPagamento;
import org.casadocodigo.loja.models.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.async.DeferredResult;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	private ShoppingCart shoppingCart;

	@Autowired
	private RestTemplate restTemplate;

	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	public DeferredResult<String> checkout() {
		
		BigDecimal total = shoppingCart.getTotal();
		
		DeferredResult<String> result = new DeferredResult<String>();
		
		IntegrandoComPagamento integrandoComPagamento = new IntegrandoComPagamento(result, total, restTemplate);
		
		Thread thread = new Thread(integrandoComPagamento);
		thread.start();
		
		return result;
	}
	
	@RequestMapping(value = "/sucess")
	public ModelAndView sucess() {
		ModelAndView modelAndView = new ModelAndView("shoppingCart/result");
		modelAndView.addObject("message", "Compra Realizada com sucesso");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/error")
	public ModelAndView error() {
		ModelAndView modelAndView = new ModelAndView("shoppingCart/result");
		modelAndView.addObject("message", "Compra não pode ser realizada");
		
		return modelAndView;
	}
}
