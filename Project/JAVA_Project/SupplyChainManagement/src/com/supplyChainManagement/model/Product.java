package com.supplyChainManagement.model;


/**
 * @author sanjeevkumar.v
 *
 */
public class Product {

	private String productId;
	private String productName;
	private String description;
	private double unitPrice;
	private String supplierInfo;
	private String goods;
	private String goodsDescription;
	
	
	public Product(String productId, String productName, String description, double unitPrice, String supplierInfo,
			String goods, String goodsDescription) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.description = description;
		this.unitPrice = unitPrice;
		this.supplierInfo = supplierInfo;
		this.goods = goods;
		this.goodsDescription = goodsDescription;
	}
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
	@Override 
	public String toString() {
		System.out.printf("%-30s%-30s%-30s%-30.2f%-50s%-15s%-20s", productId, productName, description, unitPrice, supplierInfo, 
				goods, goodsDescription);
		return "";
	}


}
