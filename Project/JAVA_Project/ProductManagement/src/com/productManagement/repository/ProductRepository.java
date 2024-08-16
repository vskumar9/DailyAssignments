package com.productManagement.repository;

//Importing all necessary classes for collections
import java.util.*; 

import com.productManagement.model.Product;

/**
 * Repository class for managing product data.
 * Provides methods to perform CRUD operations on products stored in an in-memory map.
 * 
 * @author sanjeevkumar.v
 */
public class ProductRepository {

    // Map to store products with productId as the key
    private Map<String, Product> productMap = new HashMap<>();

    /**
     * Adds a new product to the repository.
     *
     * @param product the Product object to be added
     * @return true if the product was successfully added, false otherwise
     */
    public boolean addProduct(Product product) {
        if (product == null || product.getProductId() == null) {
            throw new IllegalArgumentException("Product or Product ID cannot be null");
        }
        productMap.put(product.getProductId(), product);
        return productMap.containsKey(product.getProductId());
    }

    /**
     * Retrieves a product by its ID.
     *
     * @param productId the ID of the product to retrieve
     * @return the Product object with the specified ID, or null if not found
     */
    public Product getProduct(String productId) {
        if (productId == null) {
            throw new IllegalArgumentException("Product ID cannot be null");
        }
        return productMap.get(productId);
    }

    /**
     * Updates the details of an existing product.
     *
     * @param product the Product object with updated details
     * @return true if the product was successfully updated, false otherwise
     */
    public boolean updateProduct(Product product) {
        if (product == null || product.getProductId() == null) {
            throw new IllegalArgumentException("Product or Product ID cannot be null");
        }
        return productMap.replace(product.getProductId(), product) != null;
    }

    /**
     * Deletes a product from the repository by its ID.
     *
     * @param productId the ID of the product to delete
     * @return true if the product was successfully deleted, false otherwise
     */
    public boolean deleteProduct(String productId) {
        if (productId == null) {
            throw new IllegalArgumentException("Product ID cannot be null");
        }
        return productMap.remove(productId) != null;
    }

    /**
     * Retrieves all products from the repository.
     *
     * @return a List of all Product objects in the repository
     */
    public List<Product> getAllProduct() {
        return new ArrayList<>(productMap.values());
    }
}
