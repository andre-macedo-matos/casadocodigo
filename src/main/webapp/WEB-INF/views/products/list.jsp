<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags" %>

<customTags:pageTemplate bodyClass="" title="Produtos">
	<jsp:body>
		<security:authentication property="principal" var="user"/>
		<security:authorize access="isAuthenticated()">
			<div>
				<h1><spring:message code="users.welcome" arguments="${user.name}"/></h1>
			</div>
		</security:authorize>
		
		<h1>${sucesso}</h1>
		<h1>${message}</h1>

		<table>
			<tr>
				<td>Título</td>
				<td>Valores</td>
			</tr>
			
			<c:forEach items="${products}" var="product">
				<tr>
					<td>
						<a href="${spring:mvcUrl('PC#show').arg(0, product.id).build()}">${product.title}</a>
					</td>
					<td>
						<c:forEach items="${product.prices}" var="price">
							[${price.bookType} - R$ ${price.value}]
						</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<security:authorize access="hasRole('ROLE_ADMIN')">
			<div>
				<a href="${spring:mvcUrl('PC#form').build()}">Cadastrar Novo Produto</a>
			</div>
		</security:authorize>
	</jsp:body>
</customTags:pageTemplate>
