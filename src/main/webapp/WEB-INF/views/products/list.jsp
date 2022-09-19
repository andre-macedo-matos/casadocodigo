<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags" %>

<customTags:pageTemplate title="Produtos" contextPath="./">
	<jsp:body>
		<security:authentication property="principal" var="user"/>
		<security:authorize access="isAuthenticated()">
			<div>
				<h1 class="title"><spring:message code="users.welcome" arguments="${user.name}"/></h1>
			</div>
		</security:authorize>
		
		<h1 class="title --sucess">${sucesso}</h1>
		<h1 class="title --alert">${message}</h1>

		<table class="main-table">
			<tr>
				<td class="header"> Título</td>
				<td class="header">Valores</td>
			</tr>
			
			<c:forEach items="${products}" var="product">
				<tr>
					<td class="data">
						<a class="main-button --table" href="${spring:mvcUrl('PC#show').arg(0, product.id).build()}">${product.title}</a>
					</td>
					<td class="data">
						<c:forEach items="${product.prices}" var="price">
							[${price.bookType} - R$ ${price.value}]
						</c:forEach>
					</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td class="header" colspan="2">
					<security:authorize access="hasRole('ROLE_ADMIN')">
							<a class="main-button --table" href="${spring:mvcUrl('PC#form').build()}">Cadastrar Novo Produto</a>
					</security:authorize>
				</td>
			</tr>
		</table>
		
	</jsp:body>
</customTags:pageTemplate>
