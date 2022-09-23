package org.casadocodigo.daos;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.casadocodigo.loja.models.BookType;
import org.casadocodigo.loja.models.Product;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void save(Product product) {
		manager.persist(product);
	}

	public List<Product> list() {
		System.out.println("Listando produtos");
		return manager.createQuery("select distinct(p) from Product p join fetch p.prices", Product.class).getResultList();
	}

	@Transactional
	public Product find(Integer id) {
		String query = "select distinct(p) from Product p join fetch p.prices where p.id = :id";
		return manager.createQuery(query, Product.class).setParameter("id", id).getSingleResult();
	}
	
	public BigDecimal sumPricePerType(BookType bookType) {
		TypedQuery<BigDecimal> query = manager.createQuery("select sum(price.value) from Product p "
				+ "join p.prices price where price.bookType =:bookType", BigDecimal.class);
		query.setParameter("bookType", bookType);
		
		return query.getSingleResult();
	}

}
