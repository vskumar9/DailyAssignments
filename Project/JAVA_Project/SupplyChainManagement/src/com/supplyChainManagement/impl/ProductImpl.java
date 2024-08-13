package com.supplyChainManagement.impl;

import java.util.List;

import com.supplyChainManagement.intf.ProductIntf;
import com.supplyChainManagement.model.Product;
import com.supplyChainManagement.repository.ProductRepository;

/**
 * @author sanjeevkumar.v
 *
 */
public class ProductImpl implements ProductIntf {
	
	private ProductRepository repository = new ProductRepository();

	@Override
	public boolean createProduct(Product product) {
		// TODO Auto-generated method stub
		return repository.addProduct(product);
	}

	@Override
	public Product getProduct(String productId) {
		// TODO Auto-generated method stub
		return repository.getProduct(productId);
	}

	@Override
	public boolean updateProduct(Product product) {
		// TODO Auto-generated method stub
		return repository.updateProduct(product);
	}

	@Override
	public boolean deleteProduct(String productId) {
		// TODO Auto-generated method stub
		return repository.deleteProduct(productId);
	}

	@Override
	public List<Product> getAllProduct() {
		// TODO Auto-generated method stub
		return repository.getAllProduct();
	}
	
	
}
