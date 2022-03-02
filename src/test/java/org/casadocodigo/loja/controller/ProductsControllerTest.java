package org.casadocodigo.loja.controller;

import static org.junit.Assert.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.List;

import javax.servlet.Filter;
import javax.transaction.Transactional;

import org.casadocodigo.daos.ProductDAO;
import org.casadocodigo.loja.builders.ProductBuilder;
import org.casadocodigo.loja.config.AmazonConfiguration;
import org.casadocodigo.loja.config.AppWebConfiguration;
import org.casadocodigo.loja.config.DataSourceConfigurationTest;
import org.casadocodigo.loja.config.JPAConfiguration;
import org.casadocodigo.loja.config.SecurityConfiguration;
import org.casadocodigo.loja.models.Product;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultMatcher;
import org.springframework.test.web.servlet.request.RequestPostProcessor;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = { AppWebConfiguration.class, JPAConfiguration.class, SecurityConfiguration.class,
		DataSourceConfigurationTest.class, AmazonConfiguration.class })
@ActiveProfiles("test")
public class ProductsControllerTest {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private WebApplicationContext wac;

	@Autowired
	private Filter springSecurityFilterChain;
	
	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders
						.webAppContextSetup(this.wac)
						.addFilters(springSecurityFilterChain)
						.build();
	}

	@Test
	@Transactional
	public void shoulListAllBooksInTheHome() throws Exception {
		productDAO.save(ProductBuilder.newProduct().buildOne());
		
		new ResultMatcher() {
			@Override
			public void match(MvcResult result) throws Exception {
				ModelAndView mv = result.getModelAndView();
				@SuppressWarnings("unchecked")
				List<Product> products = (List<Product>) mv.getModel().get("products");
				
				assertEquals(1, products.size());
			}
		};
	}
	
	@Test
	public void shouldReturnListJsp() throws Exception {
		this.mockMvc.perform(get("/produtos"))
			  		.andExpect(MockMvcResultMatchers.forwardedUrl("/WEB-INF/views/products/list.jsp"));
	}
	
	@Test
	public void onlyAdminShouldAcessProductsForm() throws Exception {
		RequestPostProcessor processor = SecurityMockMvcRequestPostProcessors
			.user("buyer@casadocodigo.com.br")
			.password("buyer")
			.roles("BUYER");
		
		this.mockMvc.perform(get("/produtos/form").with(processor))
					.andExpect(MockMvcResultMatchers.status().is(403));
	}

}
