package org.casadocodigo.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.casadocodigo.loja.models.Users;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO implements UserDetailsService{

	@PersistenceContext
	private EntityManager manager;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		String jpql = "select u from Users u where u.login = :login";
		
		List<Users> users = manager.createQuery(jpql, Users.class).setParameter("login", username).getResultList();
		
		if (users.isEmpty()) {
			throw new UsernameNotFoundException("O usuário " + username + " não existe!");
		}
		
		return users.get(0);
	}
	
	
}
