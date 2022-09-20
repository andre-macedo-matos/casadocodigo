<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags" %>

<customTags:pageTemplate contextPath="${pageContext.request.contextPath}/" title="${product.title}">
	<jsp:body>
		<section class="main-wrap --book" id="product-overview">
			<img class="main-img" itemprop="image" alt="${product.title}" 
				 src="https://cdn.shopify.com/s/files/1/0155/7645/products/p_408c6b07-0499-45a6-99fe-d06b67cf92ef_large.jpg?v=1659469600">
			
			<article>
				<p class="title --book">
					<span class="product-author-link">
						${product.title}		
					</span>
				</p>
				
				<p class="description" itemprop="description" >
					${product.description}
				</p>
				
				<p>
					<a class="main-button --summary" href="<c:url value='${product.summaryPath}'/>" target="_blank">Veja Sumário completo do livro!</a> 
				</p>
			</article>
			
			<article class="section">
				<form:form class="main-form" servletRelativeAction="/shopping" cssClass="container">
					<input type="hidden" value="${product.id}" name="productId"/>
						<ul class="main-list" id="variants" class="clearfix">
							<c:forEach items="${product.prices}" var="price">
								<li class="line">
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
							
							<li class="line">
								<input class="main-button --submit --form"
						   			   type="submit"
						   			   alt="Compre agora" title="Compre agora '${product.title}'!" value="comprar">	
							</li>
						</ul>
				</form:form>
			</article>
		</section>
	
	</jsp:body>
</customTags:pageTemplate>