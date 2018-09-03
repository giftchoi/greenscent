package model;

import java.util.ArrayList;

public class DiaryListVO {
	private ArrayList<DiaryVO> list;
	private PagingBean pagingBean;
	public DiaryListVO(ArrayList<DiaryVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public DiaryListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArrayList<DiaryVO> getList() {
		return list;
	}
	public void setList(ArrayList<DiaryVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	
}
