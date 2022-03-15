<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="customTags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<customTags:pageTemplate bodyClass="cart" title="Seu Carrinho de compras">
	<jsp:attribute name="scripts"></jsp:attribute>
	
	<jsp:body>
		<section class="container middle">
			<h2 id="cart-title">Seu Carrinho de compras</h2>
			<table id="cart-table">
				<colgroup class="item-col">
				<colgroup class="item-price-col">
				<colgroup class="item-quantity-col">
				<colgroup class="line-price-col">
				<colgroup class="delete-col">
				<thead>
					<tr>
						<th class="cart-img-col></th>
						<th width="65%">Item</th>
						<th width="10%">Preço</th>
						<th width="10%">Quantidade</th>
						<th width="10%">Total</th>
						<th width="5%"></th>
					</tr>
				</thead>
					<tbody>
						<c:forEach items="${shoppingCart.list}" var="item">
							<tr>
								<td class="cart-img-col">
									<img alt="${item.product.title}" src="">
								</td>
								
								<td class="item-title">
									${item.product.title} - ${item.bookType}
								</td>
								
								<td class="numeric-cell">
									${item.price}
								</td>
								
								<td class="quantity-input-cell">
									<input type="number" min="0" readonly="readonly" value="${shoppingCart.getQuantity(item)}">
								</td>
								
								<td class="numeric-cell">
									${shoppingCart.getTotal(item)}
								</td>
							</tr>
						</c:forEach>
					</tbody>
					
					<tfoot>
						<tr>
							<td colsan="2">
								<form:form method="post" action="${spring:mvcUrl('PC#checkout').build()}">
									<input type="submit" class="checkout" name="checkout" value="Finalizar compra" id="checkout"> 
								</form:form> 
							</td>
							
							<td class="numeric-cell">
								R$ ${shoppingCart.total}
							</td>
						</tr>
					</tfoot>
				</table>
			</section>
		</jsp:body>
	</customTags:pageTemplate>
