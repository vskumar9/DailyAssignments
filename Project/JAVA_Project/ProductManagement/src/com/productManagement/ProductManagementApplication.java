package com.productManagement;

// Importing necessary classes.
import java.util.ArrayList;
import java.util.Scanner;

import com.productManagement.model.Product;
import com.productManagement.service.ProductService;

/**
 * Main application class for managing products.
 * Provides an interactive console interface for adding, deleting, updating, and retrieving products.
 * Handles user input and interacts with ProductService to perform various product management operations.
 * 
 * @author sanjeevkumar.v
 */
public class ProductManagementApplication {

    /**
     * The entry point of the application.
     * Initializes the ProductService and handles user interactions through a console menu.
     *
     * @param args command-line arguments (not used)
     */
    public static void main(String[] args) {
        ProductService productService = new ProductService();
        System.out.println("----------WELCOME TO ADMIN DASHBOARD----------");

        try (Scanner scanner = new Scanner(System.in)) {
            char userChoice;
            do {
                System.out.print("a. Add Products\nb. Delete Products\nc. Get Products\nd. Update Products\ne. Exit\nEnter your choice: ");
                userChoice = scanner.next().charAt(0);
                scanner.nextLine(); // Consume newline left-over

                switch (userChoice) {
                    case 'a':
                        // Add Product
                        System.out.println("Enter Product Details [ProductName : Description : Price : SupplierId : Goods : Goods Description]: ");
                        String addProductInfo = scanner.nextLine();
                        String addResult = productService.createProduct(addProductInfo);
                        if (addResult != null) {
                            System.out.println(addResult);
                        } else {
                            System.out.println("Product not added.");
                        }
                        break;

                    case 'b':
                        // Delete Product
                        System.out.println("Enter ProductId: ");
                        String deleteProductId = scanner.nextLine();
                        if (productService.deleteProduct(deleteProductId)) {
                            System.out.println("Product successfully deleted.");
                        } else {
                            System.out.println("Product not deleted or does not exist.");
                        }
                        break;

                    case 'c':
                        // Get Products
                        ArrayList<Product> productList = (ArrayList<Product>) productService.getAllProduct();
                        System.out.println();
                        if (!productList.isEmpty()) {
                            System.out.printf("%-30s%-30s%-30s%-10s%-50s%-15s%-20s", "ProductId", "ProductName", "Description", "Unit Price", "Supplier", "Goods", "Goods Description");
                            System.out.println();
                            System.out.println("----------------------------------------------------------------------------------------------");
                            for (Product product : productList) {
                                System.out.println(product);
                            }
                            System.out.println();
                        } else {
                            System.out.println("No products available.");
                        }
                        break;

                    case 'd':
                        // Update Product
                        System.out.println("Enter Product Details [ProductId : ProductName : Description : Price : SupplierId : Goods : Goods Description]: ");
                        String updateProductInfo = scanner.nextLine();
                        String updateResult = productService.updateProduct(updateProductInfo);
                        System.out.println(updateResult != null ? updateResult : "Product details not updated.");
                        break;

                    case 'e':
                        // Exit
                        System.out.println(".........Thank you.........\nClosing Application.");
                        break;

                    default:
                        System.out.println("Invalid choice. Please select a correct option.");
                        break;
                }
            } while (userChoice != 'e');
        } catch (Exception e) {
            System.out.println();
            System.out.println("An error occurred. Please try again.");
            System.out.println("Error details: " + e.getMessage());
            System.out.println();
            // Log the exception and consider restarting or exiting the application as appropriate
        }
    }
}
