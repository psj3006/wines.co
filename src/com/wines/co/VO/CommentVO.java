package com.wines.co.VO;

public class CommentVO {
	int com_num, q_num;
	String id, content, regdate;
	
	CommentVO() { }

	public CommentVO(int q_num, String id, String content) {
		super();
		this.q_num = q_num;
		this.id = id;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
