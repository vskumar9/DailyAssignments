package com.productManagement.impl;

//Importing all necessary classes for collections
import java.util.List;

import com.productManagement.intf.ProductIntf;
import com.productManagement.model.Product;
import com.productManagement.repository.ProductRepository;

/**
 * Implementation of the ProductIntf interface for managing products.
 * This class interacts with the ProductRepository to perform CRUD operations on Product objects.
 * 
 * @author sanjeevkumar.v
 */
public class ProductImpl implements ProductIntf {

    private ProductRepository repository = new ProductRepository();

    /**
     * Creates a new product and stores it in the repository.
     *
     * @param product the Product object to be created
     * @return true if the product was successfully added, false otherwise
     */
    @Override
    public boolean createProduct(Product product) {
        try {
            return repository.addProduct(product);
        } catch (Exception e) {
            System.err.println("Error creating product: " + e.getMessage());
            return false;
        }
    }

    /**
     * Retrieves a product by its ID from the repository.
     *
     * @param productId the ID of the product to retrieve
     * @return the Product object with the specified ID, or null if not found
     */
    @Override
    public Product getProduct(String productId) {
        try {
            return repository.getProduct(productId);
        } catch (Exception e) {
            System.err.println("Error retrieving product: " + e.getMessage());
            return null;
        }
    }

    /**
     * Updates the details of an existing product in the repository.
     *
     * @param product the Product object with updated details
     * @return true if the product was successfully updated, false otherwise
     */
    @Override
    public boolean updateProduct(Product product) {
        try {
            return repository.updateProduct(product);
        } catch (Exception e) {
            System.err.println("Error updating product: " + e.getMessage());
            return false;
        }
    }

    /**
     * Deletes a product from the repository by its ID.
     *
     * @param productId the ID of the product to delete
     * @return true if the product was successfully deleted, false otherwise
     */
    @Override
    public boolean deleteProduct(String productId) {
        try {
            return repository.deleteProduct(productId);
        } catch (Exception e) {
            System.err.println("Error deleting product: " + e.getMessage());
            return false;
        }
    }

    /**
     * Retrieves all products from the repository.
     *
     * @return a List of all Product objects in the repository
     */
    @Override
    public List<Product> getAllProduct() {
        try {
            return repository.getAllProduct();
        } catch (Exception e) {
            System.err.println("Error retrieving products: " + e.getMessage());
            return List.of(); // Return an empty list in case of an error
        }
    }
}
