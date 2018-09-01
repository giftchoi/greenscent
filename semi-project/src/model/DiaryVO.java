package model;

public class DiaryVO extends BoardVO{
	private int dno;
	private boolean secretYN;
	public DiaryVO() {
		super();
	}
	public DiaryVO(int dno,String title, String content, String regDate, MemberVO vo, boolean secretYN) {
		super(title, content, regDate, vo);
		this.dno = dno;
		this.secretYN = secretYN;
	}
	public DiaryVO(String title, String content, MemberVO vo, boolean secretYN) {
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
		if(secretYN) return 1;
		else return 0;
	}
	public void setSecretYN(int secretYN) {
		if(secretYN==1) 
				this.secretYN = true;
		else this.secretYN=false;
	}

}
