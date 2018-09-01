package model;

public class DiaryVO extends BoardVO{
	private int dno;
	private int secretYN;
	public DiaryVO() {
		super();
	}
	public DiaryVO(int dno,String title, String content, String regDate, MemberVO vo, int secretYN) {
		super(title, content, regDate, vo);
		this.dno = dno;
		this.secretYN = secretYN;
	}
	public DiaryVO(String title, String content, MemberVO vo, int secretYN) {
		super(title, content, vo);
		this.secretYN = secretYN;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public int getSecretYN() {
		return secretYN;
	}
	public void setSecretYN(int secretYN) {
		this.secretYN=secretYN;
	}

}
