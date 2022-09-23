package org.casadocodigo.loja.config;

import java.net.URISyntaxException;
import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class JPAProductionConfiguration {

	@Bean
	@Profile("prod")
	public DataSource dataSource() throws URISyntaxException{
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		
		dataSource.setDriverClassName("org.postgresql.Driver");
        dataSource.setUrl(System.getProperty("JDBC_DATABASE_URL", "jdbc:postgresql://localhost:5432/casadocodigo"));
        dataSource.setUsername(System.getProperty("JDBC_DATABASE_USERNAME", "postgres"));
        dataSource.setPassword(System.getProperty("JDBC_DATABASE_PASSWORD",""));
		
		return dataSource;
	}
	
	@Bean
	@Profile("prod")
	public Properties additionalProperties() {
		Properties properties = new Properties();
		properties.setProperty("hibernate.hbm2ddl.auto", "update");
		properties.setProperty("hbernate.show_sql", "true");
		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
		
		return properties;
	}
}
