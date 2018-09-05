package model;

import java.util.ArrayList;

public class TipVO extends BoardVO{
	private int tNo;
	private int hits;
	private ArrayList<ReplyVO> trvo;
	private MemberVO memberVO;
	private ArrayList<String> fileList;
	public TipVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TipVO(String title, String content, MemberVO vo) {
		super(title, content, vo);
		// TODO Auto-generated constructor stub
	}
	public TipVO(String title, String content, String regDate, MemberVO vo) {
		super(title, content, regDate, vo);
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "TipVO [tNo=" + tNo + ", hits=" + hits + ", trvo=" + trvo + ", memberVO=" + memberVO + ", fileList="
				+ fileList + "]";
	}
	public TipVO(String title, String content, String regDate, MemberVO vo, int tNo, int hits,
			ArrayList<ReplyVO> trvo, MemberVO memberVO, ArrayList<String> fileList) {
		super(title, content, regDate, vo);
		this.tNo = tNo;
		this.hits = hits;
		this.trvo = trvo;
		this.memberVO = memberVO;
		this.fileList = fileList;
	}
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public ArrayList<ReplyVO> getTrvo() {
		return trvo;
	}
	public void setTrvo(ArrayList<ReplyVO> trvo) {
		this.trvo = trvo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public ArrayList<String> getFileList() {
		return fileList;
	}
	public void setFileList(ArrayList<String> fileList) {
		this.fileList = fileList;
	}

}
