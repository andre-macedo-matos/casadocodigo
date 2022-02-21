<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Produtos Cadastrados</title>
</head>

<body>
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
					<a href="${spring:mvcUrl('PC#show').arg(0,product.id).build()}">${product.title}</a>
				</td>
				<td>
					<c:forEach items="${product.prices}" var="price">
						[${price.bookType} - R$ ${price.value}]
					</c:forEach>
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>