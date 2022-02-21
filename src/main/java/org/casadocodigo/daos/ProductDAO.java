package org.casadocodigo.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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

	public Product find(Integer id) {
		String query = "select distinct(p) from Product p join fetch p.prices where p.id = :id";
		return manager.createQuery(query, Product.class).setParameter("id", id).getSingleResult();
	}

}
