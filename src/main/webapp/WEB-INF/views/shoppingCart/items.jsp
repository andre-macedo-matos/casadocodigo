<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrinho</title>
</head>
<body>

	<table>
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
					<form method="post" action="${spring:mvcUrl('PC#checkout').build()}">
						<input type="submit" class="checkout" name="checkout" value="Finalizar compra" id="checkout">
					</form>
				</td>
				
				<td class="numeric-cell">
					R$ ${shoppingCart.total}
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>