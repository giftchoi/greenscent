package model;

import java.util.ArrayList;

public class DiaryVO extends BoardVO {
	private int dno;
	private int secretYN;
	private ArrayList<String> filelist;
	private ArrayList<ReplyVO> drvo;
	public DiaryVO() {
		super();
	}

	public DiaryVO(int dno, String title, String content, String regDate, MemberVO vo, int secretYN) {
		super(title, content, regDate, vo);
		this.dno = dno;
		this.secretYN = secretYN;
	}

	public DiaryVO(String title, String content, MemberVO vo, int secretYN) {
		super(title, content, vo);
		this.secretYN = secretYN;
	}

	public DiaryVO(int dno, String title, String content, int secretYN, ArrayList<String> fileList) {
		super(title, content, null);
		this.dno = dno;
		this.secretYN = secretYN;
		this.filelist = fileList;
	}

	public DiaryVO(int dno, String title, String content, int secretYN) {
		super(title, content, null);
		this.dno = dno;
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
		this.secretYN = secretYN;
	}

	public ArrayList<String> getFilelist() {
		return filelist;
	}

	public void setFilelist(ArrayList<String> filelist) {
		this.filelist = filelist;
	}

	public ArrayList<ReplyVO> getDrvo() {
		return drvo;
	}

	public void setDrvo(ArrayList<ReplyVO> drvo) {
		this.drvo = drvo;
	}
	
}
