package com.productManagement.model;

/**
 * Represents a product in the product management system.
 * Contains details about the product including its ID, name, description, price, supplier information, and goods details.
 * Provides methods to access and modify product attributes.
 * 
 * @author sanjeevkumar.v
 */
public class Product {

    private String productId;
    private String productName;
    private String description;
    private double unitPrice;
    private String supplierInfo;
    private String goods;
    private String goodsDescription;

    /**
     * Constructs a Product object with the specified details.
     *
     * @param productId        the unique identifier of the product
     * @param productName      the name of the product
     * @param description      a description of the product
     * @param unitPrice        the price per unit of the product
     * @param supplierInfo     information about the supplier of the product
     * @param goods            type of goods
     * @param goodsDescription description of the goods
     */
    public Product(String productId, String productName, String description, double unitPrice, String supplierInfo,
                   String goods, String goodsDescription) {
        this.productId = productId;
        this.productName = productName;
        this.description = description;
        this.unitPrice = unitPrice;
        this.supplierInfo = supplierInfo;
        this.goods = goods;
        this.goodsDescription = goodsDescription;
    }

    // Getters and setters

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getSupplierInfo() {
        return supplierInfo;
    }

    public void setSupplierInfo(String supplierInfo) {
        this.supplierInfo = supplierInfo;
    }

    public String getGoods() {
        return goods;
    }

    public void setGoods(String goods) {
        this.goods = goods;
    }

    public String getGoodsDescription() {
        return goodsDescription;
    }

    public void setGoodsDescription(String goodsDescription) {
        this.goodsDescription = goodsDescription;
    }

    /**
     * Returns a string representation of the Product object.
     * The string contains all product details formatted in a readable way.
     *
     * @return a formatted string representing the product details
     */
    @Override
    public String toString() {
        return String.format("%-30s%-30s%-30s%-10.2f%-50s%-15s%-20s",
                productId, productName, description, unitPrice, supplierInfo, goods, goodsDescription);
    }
}
