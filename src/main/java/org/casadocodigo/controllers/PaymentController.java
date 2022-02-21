package org.casadocodigo.controllers;

import java.math.BigDecimal;
import java.util.concurrent.Callable;

import org.casadocodigo.loja.models.PaymentData;
import org.casadocodigo.loja.models.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.WebApplicationContext;

@Controller
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	private ShoppingCart shoppingCart;

	@Autowired
	private RestTemplate restTemplate;

	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	public Callable<String> checkout() {
		
		return () -> {
			BigDecimal total = shoppingCart.getTotal();
			
			String uriToPay = "http://book-payment.herokuapp.com/payment";
			try {
				restTemplate.postForObject(uriToPay, new PaymentData(total), String.class);
				
				return "redirect:/payment/sucess";
			} catch (HttpClientErrorException e) {
				return "redirect:/payment/error";
			}
		};
	}
}
