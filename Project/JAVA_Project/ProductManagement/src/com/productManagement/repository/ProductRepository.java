package com.productManagement.repository;
import java.util.*;

import com.productManagement.model.Product;

/**
 * @author sanjeevkumar.v
 *
 */
public class ProductRepository {
	
	private Map<String, Product> productMap = new HashMap<String, Product>();
	
	public boolean addProduct(Product productInfo) {
		productMap.put(productInfo.getProductId(), productInfo);
		return productMap.containsKey(productInfo.getProductId());
	}
	
	public Product getProduct(String productId) {
		return productMap.get(productId);
	}
	
	public boolean updateProduct(Product productInfo) {
		return productMap.put(productInfo.getProductId(), productInfo) != null;
	}
	
	public boolean deleteProduct(String industryId) {
		productMap.remove(industryId);
		return !productMap.containsKey(industryId);
	}
	
	public List<Product> getAllProduct() {
	    return new ArrayList<>(productMap.values());
	}

	

}
