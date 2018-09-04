package model;

import java.util.ArrayList;

public class QnaListVO {
	private ArrayList<QnaVO> list;
	private PagingBean pagingBean;
	public  QnaListVO(){
		super();
		// TODO Auto-generated constructor stub
	}
	public  QnaListVO(ArrayList<QnaVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	
	public ArrayList<QnaVO> getList() {
		return list;
	}
	public void setList(ArrayList<QnaVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "QnaListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	 
}
