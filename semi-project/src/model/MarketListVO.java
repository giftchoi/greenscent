package model;

import java.util.ArrayList;

public class MarketListVO {
	private ArrayList<MarketVO> list;
	private PagingBean pagingBean;
	public MarketListVO(ArrayList<MarketVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public MarketListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArrayList<MarketVO> getList() {
		return list;
	}
	public void setList(ArrayList<MarketVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	
	
}
