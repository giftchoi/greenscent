package model;

public class DiaryVO extends BoardVO{
	private int dno;
	private boolean isPublic;
	public DiaryVO(int dno,String title, String content, String regDate, MemberVO vo, boolean isPublic) {
		super(title, content, regDate, vo);
		this.dno = dno;
		this.isPublic = isPublic;
	}
	public DiaryVO(String title, String content, MemberVO vo, boolean isPublic) {
		super(title, content, vo);
		this.isPublic = isPublic;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public boolean isPublic() {
		return isPublic;
	}
	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}

}
