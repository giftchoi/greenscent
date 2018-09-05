package model;

import java.util.ArrayList;

public class MarketVO extends BoardVO{
	private int mno;
	private int state;
	private ArrayList<String> filelist;
	private MemberVO memberVO;

	public void setFilelist(ArrayList<String> filelist) {
		this.filelist = filelist;
	}

	public MarketVO(String title, String content, String regDate, MemberVO vo, int mno, int state,
			ArrayList<String> filelist, MemberVO memberVO) {
		super(title, content, regDate, vo);
		this.mno = mno;
		this.state = state;
		this.filelist = filelist;
		this.memberVO = memberVO;
	}

	public MarketVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MarketVO(String title, String content, MemberVO vo) {
		super(title, content, vo);
		// TODO Auto-generated constructor stub
	}

	public MarketVO(String title, String content, String regDate, MemberVO vo) {
		super(title, content, regDate, vo);
		// TODO Auto-generated constructor stub
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public ArrayList<String> getFilelist() {
		return filelist;
	}

	@Override
	public String toString() {
		return "MarketVO [mno=" + mno + ", state=" + state + ", filelist=" + filelist + ", memberVO=" + memberVO + "]";
	}

	
	
	
}
