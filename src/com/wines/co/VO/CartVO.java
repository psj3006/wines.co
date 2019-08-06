package com.wines.co.VO;

public class CartVO {
	String id;
	int p_num, amount;
	
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
	
	
}
