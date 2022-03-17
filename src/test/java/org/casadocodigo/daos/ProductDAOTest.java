package org.casadocodigo.daos;

import static org.junit.Assert.*;

import java.math.BigDecimal;
import java.util.List;

import javax.transaction.Transactional;

import org.casadocodigo.loja.builders.ProductBuilder;
import org.casadocodigo.loja.config.JPAConfiguration;
import org.casadocodigo.loja.config.JPAConfigurationTest;
import org.casadocodigo.loja.models.BookType;
import org.casadocodigo.loja.models.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {JPAConfigurationTest.class, ProductDAO.class, JPAConfiguration.class})
@ActiveProfiles("test")
public class ProductDAOTest {

	@Autowired
	private ProductDAO productDAO;
	
	@Transactional
	@Test
	public void shouldSumAllPricesOfSameBookType() {
		List<Product> printeds = ProductBuilder.newProduct(BookType.PRINTED, BigDecimal.TEN).more(4).buildAll();
		List<Product> ebooks = ProductBuilder.newProduct(BookType.EBOOK, BigDecimal.TEN).more(4).buildAll();
		
		printeds.stream().forEach(productDAO::save);
		ebooks.stream().forEach(productDAO::save);
		
		BigDecimal printedSum = productDAO.sumPricePerType(BookType.PRINTED);
		assertEquals(new BigDecimal(50).setScale(2), printedSum);
	}

}
