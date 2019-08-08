package com.wines.co.VO;

public class OrderVO {
	String id, o_name, o_addr, o_tel, order_date, p_name, p_price, p_saleprice, p_image;
	int o_num, totalprice, p_num, amount;
	
	public OrderVO() { }
	
	public OrderVO(String id, String o_name, String o_addr, String o_tel, int totalprice, int p_num, int amount) {
		super();
		this.id = id;
		this.o_name = o_name;
		this.o_addr = o_addr;
		this.o_tel = o_tel;
		this.totalprice = totalprice;
		this.p_num = p_num;
		this.amount = amount;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_addr() {
		return o_addr;
	}
	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}
	public String getO_tel() {
		return o_tel;
	}
	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
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
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
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
	
	
}
