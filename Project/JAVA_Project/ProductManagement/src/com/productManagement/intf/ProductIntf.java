package com.productManagement.intf;

//Importing all necessary classes for collections
import java.util.List;

import com.productManagement.model.Product;

/**
 * Interface for managing products in the product management system.
 * Defines CRUD operations that can be performed on Product objects.
 * Implementing classes should provide concrete implementations for these methods.
 * 
 * @author sanjeevkumar.v
 */
public interface ProductIntf {

    /**
     * Creates a new product and stores it in the repository.
     *
     * @param product the Product object to be created
     * @return true if the product was successfully created, false otherwise
     */
    boolean createProduct(Product product);

    /**
     * Retrieves a product by its ID.
     *
     * @param productId the ID of the product to retrieve
     * @return the Product object with the specified ID, or null if not found
     */
    Product getProduct(String productId);

    /**
     * Updates the details of an existing product.
     *
     * @param product the Product object with updated details
     * @return true if the product was successfully updated, false otherwise
     */
    boolean updateProduct(Product product);

    /**
     * Deletes a product by its ID.
     *
     * @param productId the ID of the product to delete
     * @return true if the product was successfully deleted, false otherwise
     */
    boolean deleteProduct(String productId);

    /**
     * Retrieves all products from the repository.
     *
     * @return a List of all Product objects
     */
    List<Product> getAllProduct();
}
