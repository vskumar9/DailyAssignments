package com.supplyChainManagement.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.supplyChainManagement.impl.ProductImpl;
import com.supplyChainManagement.intf.ProductIntf;
import com.supplyChainManagement.model.Product;

public class ProductService {

	
	private ProductIntf productIntf = new ProductImpl();	
	
	public String createProduct(String productInfo) {
		
		String[] product = productInfo.split(":");
		
		String productId = "PROD" + generateUniqueId();
		Product productDetails = new Product(productId, product[0], product[1], Integer.parseInt(product[2]), product[3], 
				product[4], product[5]);
		if(productIntf.createProduct(productDetails)) {
			return "ProductId: "+ productId;
		}		
			
		return null;
	}
	
	public Product getProduct(String productId) {
		Product product = productIntf.getProduct(productId);

		if(product != null) {
			return product;
		}
		return null;
	}
	
	public String updateProduct(String productInfo) {
		
		String[] product = productInfo.split(":");
		
		Product productDetails = new Product(product[0], product[1], product[2], Integer.parseInt(product[3]), product[4], 
				product[5], product[6]);
		return productIntf.updateProduct(productDetails) == true ? "Updated Successfully" : "Not updated.";
	}
	
	public boolean deleteProduct(String productId) {
		return productIntf.deleteProduct(productId);
	}
	
	 public List<Product> getAllProduct() {
	        return productIntf.getAllProduct();
	    }
	
	public String generateUniqueId() {
	       return generateSCMId();
	    }
	
	private String generateSCMId() {
     SimpleDateFormat dateFormat = new SimpleDateFormat("yyMddHHmmSS");
     String timestamp = dateFormat.format(new Date());
	    int randomSuffix = (int) (Math.random() * 1000); // Add a random suffix for uniqueness
	    return timestamp + String.format("%03d", randomSuffix);
	    }

}
