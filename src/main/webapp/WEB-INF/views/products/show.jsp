<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags" %>

<customTags:pageTemplate contextPath="./../../" title="${product.title }">
	<jsp:body>
		<header id="product-highlight" class="clearfix">
			<div id="product-overview" class="container">
				<img itemprop="image" width="280px" height="395px" class="product-featured-image" alt="${product.title}" src="">
				<h1 class="product-featured-image">
					${product.title}
				</h1>
				<p class="product-author">
					<span class="product-author-link">
						${product.title}		
					</span>
				</p>
				
				<p itemprop="description" class="book-description">
					${product.description}
					Veja <a href="<c:url value='/${product.summaryPath}'/>" target="_blank">Sum�rio</a> completo do livro!
				</p>
			</div>
		</header>
	
		<section class="buy-options clearfix">
			<form:form servletRelativeAction="/shopping" cssClass="container">
				<input type="hidden" value="${product.id}" name="productId"/>
					<ul id="variants" class="clearfix">
						<c:forEach items="${product.prices}" var="price">
							<li class="buy-option">
								<input type="radio" 
									name="bookType" 
									class="variant-radio" 
									id="${product.id} - ${price.bookType}" 
									value="${price.bookType}" 
									${price.bookType.name() == 'COMBO' ? 'checked' : ''}>
									
								<label class="variant-label" for="${product.id}-${price.bookType}">
									${price.bookType}
								</label>
								<p class="variant-price">${price.value}</p>
							</li>
						</c:forEach>
						
						<li>
							<a href="${spring:mvcUrl('SC#items').build()}">Seu carrinho (${shoppingCart.quantity})</a>
						</li>
					</ul>
				<input type="submit" class="submit-image icon-basket-alt" alt="Compre agora" title="Compre agora '${product.title}'!" value="comprar">	
			</form:form>
		</section>
	</jsp:body>
</customTags:pageTemplate>