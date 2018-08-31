package model;

public class DiaryVO extends BoardVO{
	private String dno;
	private int state;
	private boolean isPublic;
	public DiaryVO(String dno,String title, String content, String regDate, MemberVO vo, int state, boolean isPublic) {
		super(title, content, regDate, vo);
		this.dno = dno;
		this.state = state;
		this.isPublic = isPublic;
	}
	public DiaryVO() {
		super();
	}
	public DiaryVO(String title, String content, MemberVO vo,int state,boolean isPublic) {
		super(title, content, vo);
		this.state=state;
		this.isPublic=isPublic;
	}
	public String getDno() {
		return dno;
	}
	public void setDno(String dno) {
		this.dno = dno;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public boolean isPublic() {
		return isPublic;
	}
	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}
	
}
