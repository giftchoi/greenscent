package model;

public class QReplyVO {
	private String qrNo;
	private String qNo;
	private String id;
	private String content;
	private String regDate;
	public QReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QReplyVO(String qrNo, String qNo, String id, String content, String regDate) {
		super();
		this.qrNo = qrNo;
		this.qNo = qNo;
		this.id = id;
		this.content = content;
		this.regDate = regDate;
	}
	public String getQrNo() {
		return qrNo;
	}
	public void setQrNo(String qrNo) {
		this.qrNo = qrNo;
	}
	public String getqNo() {
		return qNo;
	}
	public void setqNo(String qNo) {
		this.qNo = qNo;
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
	
}
