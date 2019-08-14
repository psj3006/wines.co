package com.wines.co.VO;

public class ProductVO {
	int p_num;
	String p_name, p_content, p_price, p_saleprice, p_image;
	
	public ProductVO() { }
	
	public ProductVO(int p_num, String p_name, String p_content, String p_price, String p_saleprice, String p_image) {
		super();
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_content = p_content;
		this.p_price = p_price;
		this.p_saleprice = p_saleprice;
		this.p_image = p_image;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
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

	
}
