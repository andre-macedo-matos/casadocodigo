package org.casadocodigo.loja.models;

import java.math.BigDecimal;

import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.async.DeferredResult;

public class IntegrandoComPagamento implements Runnable {

	private DeferredResult<String> result;
	private BigDecimal total;
	private RestTemplate restTemplate;

	public IntegrandoComPagamento(DeferredResult<String> result, BigDecimal total, RestTemplate restTemplate) {
		this.result = result;
		this.total = total;
		this.restTemplate = restTemplate;
	}

	@Override
	public void run() {
		String uriToPay = "http://book-payment.herokuapp.com/payment";
		try {
			restTemplate.postForObject(uriToPay, new PaymentData(total), String.class);

			result.setResult("redirect:/payment/sucess");
		} catch (HttpClientErrorException e) {
			result.setResult("redirect:/payment/error");
		}
	}

}
