package org.casadocodigo.loja.config;

import java.net.URISyntaxException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class JPAProductionConfiguration {

	@Autowired
	private Environment environment;
	
	@Bean
	@Profile("prod")
	public DataSource dataSource() throws URISyntaxException{
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		
		dataSource.setDriverClassName("org.postgresql.Driver");
        dataSource.setUrl(environment.getProperty("JDBC_DATABASE_URL", "jdbc:postgresql://localhost:5432/casadocodigo"));
        dataSource.setUsername(environment.getProperty("JDBC_DATABASE_USERNAME", "postgres"));
        dataSource.setPassword(environment.getProperty("JDBC_DATABASE_PASSWORD",""));
		
		return dataSource;
	}
}
