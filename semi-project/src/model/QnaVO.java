package model;

import java.util.ArrayList;

public class QnaVO extends BoardVO{
	private String qNo;
	private ArrayList<QReplyVO> qrvo;
	private ArrayList<QImageVO> qivo;
	private MemberVO mvo;
	
	public QnaVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MemberVO getMvo() {
		return mvo;
	}


	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}


	public QnaVO(String title, String content, MemberVO vo) {
		super(title, content, vo);
		// TODO Auto-generated constructor stub
		
	}


	public QnaVO(String title, String content, String regDate, MemberVO vo) {
		super(title, content, regDate, vo);
		// TODO Auto-generated constructor stub
	}

	public QnaVO(String title, String content, String regDate, MemberVO vo, String qNo, ArrayList<QReplyVO> qrvo, ArrayList<QImageVO> qivo) {
		super(title, content, regDate, vo);
		this.qNo = qNo;
		this.qrvo = qrvo;
		this.qivo = qivo;
	}


	public String getqNo() {
		return qNo;
	}


	public void setqNo(String qNo) {
		this.qNo = qNo;
	}


	public ArrayList<QReplyVO> getQrvo() {
		return qrvo;
	}


	public void setQrvo(ArrayList<QReplyVO> qrvo) {
		this.qrvo = qrvo;
	}


	public ArrayList<QImageVO> getQivo() {
		return qivo;
	}


	public void setQivo(ArrayList<QImageVO> qivo) {
		this.qivo = qivo;
	}
	


}
