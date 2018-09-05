package model;

public class ReplyVO {
	private String trNo;
	private String tNo;
	private String id;
	private String content;
	private String regDate;
	public ReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReplyVO(String trNo, String tNo, String id, String content, String regDate) {
		super();
		this.trNo = trNo;
		this.tNo = tNo;
		this.id = id;
		this.content = content;
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "TReplayVO [trNo=" + trNo + ", tNo=" + tNo + ", id=" + id + ", content=" + content + ", regDate="
				+ regDate + "]";
	}
	public String getTrNo() {
		return trNo;
	}
	public void setTrNo(String trNo) {
		this.trNo = trNo;
	}
	public String gettNo() {
		return tNo;
	}
	public void settNo(String tNo) {
		this.tNo = tNo;
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
