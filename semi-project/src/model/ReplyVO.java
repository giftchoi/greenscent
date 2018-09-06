package model;

public class ReplyVO {
	private String rNo;
	private String no;
	private String id;
	private String content;
	private String regDate;
	public ReplyVO(String rNo, String no, String id, String content, String regDate) {
		super();
		this.rNo = rNo;
		this.no = no;
		this.id = id;
		this.content = content;
		this.regDate = regDate;
	}
	public String getrNo() {
		return rNo;
	}
	public void setrNo(String rNo) {
		this.rNo = rNo;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [rNo=" + rNo + ", no=" + no + ", id=" + id + ", content=" + content + ", regDate=" + regDate
				+ "]";
	}
	
	
}
