<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<customTags:pageTemplate contextPath="./" title="Seu Carrinho de compras">
	<jsp:attribute name="scripts"></jsp:attribute>
	
	<jsp:body>
		<section class="container middle">
			<h2 class="title">Seu Carrinho de compras</h2>
			<table class="main-table" id="cart-table">
				<colgroup class="item-col">
				<colgroup class="item-price-col">
				<colgroup class="item-quantity-col">
				<colgroup class="line-price-col">
				<colgroup class="delete-col">
				<thead>
					<tr>
						<th class="header"></th>
						<th class="header" width="65%">Item</th>
						<th class="header" width="10%">Preço</th>
						<th class="header" width="10%">Quantidade</th>
						<th class="header" width="10%">Total</th>
					</tr>
				</thead>
					<tbody>
						<c:forEach items="${shoppingCart.list}" var="item">
							<tr>
								<td class="data --cart">
									<img class="main-logo --cover" itemprop="image" alt="${product.title}" 
				 src="https://cdn.shopify.com/s/files/1/0155/7645/products/p_408c6b07-0499-45a6-99fe-d06b67cf92ef_large.jpg?v=1659469600">
								</td>
								
								<td class="data --cart">
									${item.product.title} - ${item.bookType}
								</td>
								
								<td class="data --cart">
									${item.price}
								</td>
								
								<td class="data --cart">
									<input type="number" min="1" value="${shoppingCart.getQuantity(item)}">
								</td>
								
								<td class="data --cart">
									${shoppingCart.getTotal(item)}
								</td>
							</tr>
						</c:forEach>
					</tbody>
					
					<tfoot class="header">
						<tr>
							<td colspan="4" class="header -first-column">
								<form:form method="post" action="${spring:mvcUrl('PC#checkout').build()}">
									<input type="submit" class="main-button --submit --table --cart" 
									name="checkout" value="Finalizar compra" id="checkout"> 
								</form:form> 
							</td>
							
							<td class="header">
								R$ ${shoppingCart.total}
							</td>
						</tr>
					</tfoot>
				</table>
			</section>
		</jsp:body>
	</customTags:pageTemplate>
