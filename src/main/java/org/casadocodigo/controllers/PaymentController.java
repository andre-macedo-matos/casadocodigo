package org.casadocodigo.controllers;

import java.math.BigDecimal;

import org.casadocodigo.loja.models.IntegrandoComPagamento;
import org.casadocodigo.loja.models.ShoppingCart;
import org.casadocodigo.loja.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.async.DeferredResult;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	private ShoppingCart shoppingCart;

	@Autowired
	private RestTemplate restTemplate;
	
//	@Autowired
//	private MailSender mailer;

	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public DeferredResult<String> checkout() {
		
		BigDecimal total = shoppingCart.getTotal();
		
		DeferredResult<String> result = new DeferredResult<String>();
		
		IntegrandoComPagamento integrandoComPagamento = new IntegrandoComPagamento(result, total, restTemplate);
		
		Thread thread = new Thread(integrandoComPagamento);
		thread.start();
		
		return result;
	}
	
	@RequestMapping(value = "/sucess")
	public ModelAndView sucess(RedirectAttributes redirectAttributes, @AuthenticationPrincipal User user) {
//		sendNewPurchaseMail(user);
		
		ModelAndView modelAndView = new ModelAndView("redirect:/produtos");
		redirectAttributes.addFlashAttribute("message", "Compra Realizada com sucesso");
		
		return modelAndView;
	}

//	private void sendNewPurchaseMail(User user) {
//		SimpleMailMessage email = new SimpleMailMessage();
//		email.setFrom("compras@casadocodigo.com.br");
//		email.setTo(user.getLogin());
//		email.setSubject("Nova Compra");
//		email.setText("corpo do email");
//		mailer.send(email);
//	}
	
	@RequestMapping(value = "/error")
	public ModelAndView error(RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/produtos");
		redirectAttributes.addFlashAttribute("message", "Compra não pode ser realizada");
		
		return modelAndView;
	}
}
