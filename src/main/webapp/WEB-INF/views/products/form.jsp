<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de produtos</title>
</head>

<body>

	<form:form method="post" action="${spring:mvcUrl('PC#save').build()}" commandName="product" enctype="multipart/form-data">
		<div>
			<label for="title">Título</label>
			<form:input path="title" />
			<form:errors path="title"/>
		</div>
		
		<div>
			<label for="description">Descrição</label>
			<form:textarea rows="10" cols="20" path="description" />
			<form:errors path="description"/>
		</div>
		
		<div>
			<label for="pages">Número de páginas</label>
			<form:input path="pages" />
			<form:errors path="pages"/>
		</div>
		
		<div>
			<label for="releaseDate">Data de publicação</label>
			<form:input type="date" path="releaseDate" />
			<form:errors path="releaseDate"/>
		</div>
		
		<c:forEach items="${types}" var="bookType" varStatus="status">
			<div>
				<label for="price_${bookType}">${bookType}</label>
				<input type="text" name="prices[${status.index}].value" id="price_${booktype}">
				<input type="hidden" name="prices[${status.index}].bookType" value="${bookType}"/>
			</div>
		</c:forEach>
		
		<div>
			<label for="summary">Sumário do livro</label>
			<input type="file" name="summary"/>
			<form:errors path="summaryPath"/>
		</div>
		
		<div>
			<input type="submit" value="Enviar">
		</div>
	</form:form>
	
</body>
</html>