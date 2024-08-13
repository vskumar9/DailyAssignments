package com.productManagement;

import java.util.ArrayList;
import java.util.Scanner;

import com.productManagement.model.Product;
import com.productManagement.service.ProductService;

/**
 * @author sanjeevkumar.v
 *
 */
public class ProductManagementApplication {


	public static void main(String[] args) {
		
		ProductService productService = new ProductService();
		System.out.println("----------WELCOME TO ADMIN DASHBOARD----------");
		try(Scanner sc = new Scanner(System.in)) {
			char in1;
			do {
				System.out.print("a. Add Products\nb. Delete Products\nc. Get Products\nd. Update Products\ne. Exit\nEnter your choice: ");
				in1 = sc.next().charAt(0);
				sc.nextLine();
				switch(in1) {
				case 'a':
					System.out.println("Enter Product Details [ProductName : Description : Price : SupllierId : Goods : Goods Description]: ");
					String productInfo = sc.nextLine();
					String product = productService.createProduct(productInfo);
					if(product != null) {
						System.out.println(product);
					}
					else {
						System.out.println("Product not added.");
					}
					break;
				case 'b':
					System.out.println("Enter ProductId: ");
					String productId = sc.nextLine();
					if(productService.deleteProduct(productId)) {
						System.out.println("Successfully product deleted.");
					}
					else {
						System.out.println("Product not deleted/exists.");
					}
					break;	
				case 'c':
					ArrayList<Product> list = (ArrayList<Product>) productService.getAllProduct();
					System.out.println();
					if(!list.isEmpty()) {
						System.out.printf("%-30s%-30s%-30s%-30s%-50s%-15s%-20s", "productId", "productName", "Description", "Unit Price", "supplier", "goods", "goodsDescription");
						System.out.println();
						System.out.println("----------------------------------------------------------------------------------------------");
					    for (Product p : list) {
					        System.out.println(p);
					    }
					    System.out.println();
					}
					else {
						System.out.println("Products are not available.");
					}
					break;
				case 'd':
					System.out.println("Enter Product Details [ProductId : ProductName : Description : Price : SupllierId : Goods : Goods Description]: ");
					String productInf = sc.nextLine();
					String productDet = productService.updateProduct(productInf);
					if(productDet != null) {
						System.out.println(productDet);
					}
					else {
						System.out.println("Product details not updated.");
					}
					break;
				case 'e':
					System.out.println(".........Thank you.........\nClosing Application.");
					break;
				default:
					System.out.println("Your choice is wrong. Please select correct option.");
					break;
				}
			}while(in1 !='e');    			
		} catch(Exception e) {
			System.out.println();
			System.out.println("Something error. Please try again.....");
			System.out.println("An error occurred: " + e.getMessage());
			System.out.println();
			main(args);
		} 
	}
}