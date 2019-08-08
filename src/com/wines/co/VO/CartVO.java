package com.wines.co.VO;

public class CartVO {
	String id, p_name, p_price, p_saleprice, p_image;
	int c_num, p_num, amount;
	
	public CartVO() { }
	
	public CartVO(String id, int p_num, int amount) {
		super();
		this.id = id;
		this.p_num = p_num;
		this.amount = amount;
	}
 
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_price() {
		return p_price;
	}

	public void setP_price(String p_price) {
		this.p_price = p_price;
	}

	public String getP_saleprice() {
		return p_saleprice;
	}

	public void setP_saleprice(String p_saleprice) {
		this.p_saleprice = p_saleprice;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	
	
}
