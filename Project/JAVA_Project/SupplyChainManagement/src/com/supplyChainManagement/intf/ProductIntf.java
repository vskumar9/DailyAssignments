package com.supplyChainManagement.intf;

import java.util.List;

import com.supplyChainManagement.model.Product;

/**
 * @author sanjeevkumar.v
 *
 */
public interface ProductIntf {
	
	boolean createProduct(Product product);
	Product getProduct(String productId);
	boolean updateProduct(Product product);
	boolean deleteProduct(String productId);
	List<Product> getAllProduct();

}
