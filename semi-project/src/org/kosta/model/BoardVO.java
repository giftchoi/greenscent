package org.kosta.model;

public class BoardVO {
	private String title;
	private String content;
	private String regDate;
	private MemberVO vo;
	public BoardVO(String title, String content, String regDate, MemberVO vo) {
		super();
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.vo = vo;
	}
	public BoardVO(String title, String content, MemberVO vo) {
		super();
		this.title = title;
		this.content = content;
		this.vo = vo;
	}
	public BoardVO() {	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public MemberVO getVo() {
		return vo;
	}
	public void setVo(MemberVO vo) {
		this.vo = vo;
	}
	
}
