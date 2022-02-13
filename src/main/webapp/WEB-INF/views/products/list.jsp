<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Produtos Cadastrados</title>
</head>

<body>
	<table>
		<tr>
			<td>Título</td>
			<td>Valores</td>
		</tr>
		
		<c:forEach items="${products}" var="product">
			<tr>
				<td>${product.title}</td>
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