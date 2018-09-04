package model;

import java.util.Arrays;

public class MarketVO extends BoardVO{
	private int mno;
	private int state;
	private String[] filelist;
	private MemberVO memberVO;

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public MarketVO(String title, String content, String regDate, MemberVO vo, int mno, int state, String[] filelist) {
		super(title, content, regDate, vo);
		this.mno = mno;
		this.state = state;
		this.filelist = filelist;
	}
	
	public MarketVO(String title, String content, MemberVO vo, int mno, int state, String[] filelist) {
		super(title, content, vo);
		this.mno = mno;
		this.state = state;
		this.filelist = filelist;
	}

	public MarketVO(int mno, int state, String[] filelist) {
		super();
		this.mno = mno;
		this.state = state;
		this.filelist = filelist;
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
	public String[] getFilelist() {
		return filelist;
	}
	public void setFilelist(String[] filelist) {
		this.filelist = filelist;
	}

	
	
}
