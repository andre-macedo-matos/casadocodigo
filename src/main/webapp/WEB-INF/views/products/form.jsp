<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de produtos</title>
</head>

<body>
	<form method="post" action="/casadocodigo/produtos">
		<div>
			<label for="title">Título</label>
			<input type="text" name="title" id="title">
		</div>
		
		<div>
			<label for="descripton">Descrição</label>
			<textarea rows="10" cols="20" id="description"></textarea>
		</div>
		
		<div>
			<label for="pages">Número de páginas</label>
			<input type="text" name="pages" id="pages">
		</div>
		
		<c:forEach items="${types}" var="bookType" varStatus="status">
			<div>
				<label for ="price_${bookType}">${bookType}</label>
				<input type="text" name="prices[${status.index}].value" id="price_${booktype}">
				<input type="hidden" name="prices[${status.index}].bookType" value="${bookType}"/>
			</div>
		</c:forEach>
		
		<div>
			<input type="submit" value="Enviar">
		</div>
	</form>
	
</body>
</html>