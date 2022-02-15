package org.casadocodigo.loja.models;

import java.math.BigDecimal;

public class ShoppingItem {

	private Product product;
	private BookType bookType;
	
	public ShoppingItem(Product product, BookType bookType) {
		this.product = product;
		this.bookType = bookType;
	}

	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}

	public BookType getBookType() {
		return bookType;
	}
	public void setBookType(BookType bookType) {
		this.bookType = bookType;
	}
	
	public BigDecimal getPrice() {
		return product.priceFor(bookType);
	}
	
	public BigDecimal getTotal(Integer quantity) {
		return getPrice().multiply(new BigDecimal(quantity));
	}
	
}
