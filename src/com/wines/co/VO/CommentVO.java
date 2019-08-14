package com.wines.co.VO;

public class CommentVO {
	int com_num, q_num;
	String id, com_content, com_regdate;
	
	public CommentVO() { }

	public CommentVO(int q_num, String id, String com_content) {
		super();
		this.q_num = q_num;
		this.id = id;
		this.com_content = com_content;
	}

	public int getCom_num() {
		return com_num;
	}

	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCom_content() {
		return com_content;
	}

	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}

	public String getCom_regdate() {
		return com_regdate;
	}

	public void setCom_regdate(String Com_regdate) {
		this.com_regdate = Com_regdate;
	}
	
	
}
