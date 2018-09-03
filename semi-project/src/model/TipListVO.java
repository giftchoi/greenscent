package model;

import java.util.ArrayList;

public class TipListVO {
	private ArrayList<TipVO> list;
	private PagingBean pagingBean;
	public TipListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TipListVO(ArrayList<TipVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "TipListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	public ArrayList<TipVO> getList() {
		return list;
	}
	public void setList(ArrayList<TipVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	 
}
