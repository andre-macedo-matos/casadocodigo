package org.casadocodigo.loja.models;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION)
public class ShoppingCart {

	private Map<ShoppingItem, Integer> items = new LinkedHashMap<ShoppingItem, Integer>();

	public void add(ShoppingItem item) {
		items.put(item, getQuantity(item) + 1);
	}

	public Integer getQuantity(ShoppingItem item) {
		if (!items.containsKey(item)) {
			items.put(item, 0);
		}
		return items.get(item);
	}

	public Integer getQuantity() {
		Long count = items.values()
			.stream()
			.count();
		
		return count.intValue();
	}

}
