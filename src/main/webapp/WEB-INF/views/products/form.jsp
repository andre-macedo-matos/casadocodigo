<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags" %>

<customTags:pageTemplate contextPath="../" title="Novo Produto">
	<jsp:body>
		<h1 class="title">Novo Produto</h1>
		<form:form class="main-form --register" method="post" action="${spring:mvcUrl('PC#save').build()}" commandName="product" enctype="multipart/form-data">
			<div class="main-wrap --form">
				<label class="label" for="title">Título</label>
				<form:input class="input" path="title" />
				<form:errors path="title"/>
			</div>
			
			<div class="main-wrap --form">
				<label class="label" for="description">Descrição</label>
				<form:textarea class="input --text-area" rows="10" cols="20" path="description" />
				<form:errors path="description"/>
			</div>
			
			<div class="main-wrap --form">
				<label class="label" for="pages">Número de páginas</label>
				<form:input class="input" path="pages" />
				<form:errors path="pages"/>
			</div>
			
			<div class="main-wrap --form">
				<label class="label" for="releaseDate">Data de publicação</label>
				<form:input class="input" type="date" path="releaseDate" />
				<form:errors path="releaseDate"/>
			</div>
			
			<c:forEach items="${types}" var="bookType" varStatus="status">
				<div class="main-wrap --form">
					<label class="label" for="price_${bookType}">${bookType}</label>
					<input class="input" type="text" name="prices[${status.index}].value" id="price_${booktype}">
					<input type="hidden" name="prices[${status.index}].bookType" value="${bookType}"/>
				</div>
			</c:forEach>
			
			<div class="main-wrap --form">
				<label class="label" for="summary">Sumário do livro</label>
				<input class="input" type="file" name="summary"/>
				<form:errors path="summaryPath"/>
			</div>
			
			<div class="main-wrap --form">
				<input class="main-button --submit --form" type="submit" value="Enviar">
			</div>
		</form:form>
	</jsp:body>
</customTags:pageTemplate>
