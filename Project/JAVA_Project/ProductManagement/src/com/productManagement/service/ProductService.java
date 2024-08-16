package com.productManagement.service;

//Importing all necessary classes for collections
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.productManagement.impl.ProductImpl;
import com.productManagement.intf.ProductIntf;
import com.productManagement.model.Product;

/**
 * Service class for managing products.
 * Provides business logic for creating, retrieving, updating, and deleting products.
 * Uses ProductIntf implementation to interact with product data.
 * 
 * @author sanjeevkumar.v
 */
public class ProductService {

    private ProductIntf productIntf = new ProductImpl();

    /**
     * Creates a new product with the given product information.
     *
     * @param productInfo a string containing product details separated by colons
     * @return a message containing the product ID if the product was created successfully, or null otherwise
     */
    public String createProduct(String productInfo) {
        try {
            String[] productDetails = productInfo.split(":");

            if (productDetails.length != 6) {
                throw new IllegalArgumentException("Invalid product information format");
            }

            String productId = "PROD" + generateUniqueId();
            Product product = new Product(productId, productDetails[0], productDetails[1],
                    Double.parseDouble(productDetails[2]), productDetails[3], productDetails[4],
                    productDetails[5]);

            if (productIntf.createProduct(product)) {
                return "ProductId: " + productId;
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid number format in product information: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error creating product: " + e.getMessage());
        }
        return null;
    }

    /**
     * Retrieves a product by its ID.
     *
     * @param productId the ID of the product to retrieve
     * @return the Product object if found, or null otherwise
     */
    public Product getProduct(String productId) {
        if (productId == null || productId.trim().isEmpty()) {
            throw new IllegalArgumentException("Product ID cannot be null or empty");
        }
        return productIntf.getProduct(productId);
    }

    /**
     * Updates an existing product with the given product information.
     *
     * @param productInfo a string containing product details separated by colons
     * @return a message indicating whether the update was successful or not
     */
    public String updateProduct(String productInfo) {
        try {
            String[] productDetails = productInfo.split(":");

            if (productDetails.length != 7) {
                throw new IllegalArgumentException("Invalid product information format");
            }

            Product product = new Product(productDetails[0], productDetails[1], productDetails[2],
                    Double.parseDouble(productDetails[3]), productDetails[4], productDetails[5],
                    productDetails[6]);

            return productIntf.updateProduct(product) ? "Updated Successfully" : "Not updated.";
        } catch (NumberFormatException e) {
            System.err.println("Invalid number format in product information: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error updating product: " + e.getMessage());
        }
        return "Update failed.";
    }

    /**
     * Deletes a product by its ID.
     *
     * @param productId the ID of the product to delete
     * @return true if the product was successfully deleted, false otherwise
     */
    public boolean deleteProduct(String productId) {
        if (productId == null || productId.trim().isEmpty()) {
            throw new IllegalArgumentException("Product ID cannot be null or empty");
        }
        return productIntf.deleteProduct(productId);
    }

    /**
     * Retrieves all products.
     *
     * @return a List of all Product objects
     */
    public List<Product> getAllProduct() {
        return productIntf.getAllProduct();
    }

    /**
     * Generates a unique identifier for a product.
     *
     * @return a unique product ID
     */
    public String generateUniqueId() {
        return generateSCMId();
    }

    /**
     * Generates a unique SCM (Supply Chain Management) ID based on the current timestamp and a random suffix.
     *
     * @return a unique SCM ID
     */
    private String generateSCMId() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMddHHmmss");
        String timestamp = dateFormat.format(new Date());
        int randomSuffix = (int) (Math.random() * 1000); // Add a random suffix for uniqueness
        return timestamp + String.format("%03d", randomSuffix);
    }
}
