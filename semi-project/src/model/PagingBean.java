package model;

/**
 * 페이징 처리를 위한 비즈니스 계층의 클래스 PagingBean method 구현순서
 * getStartRowNumber()<br>
 * getEndRowNumber()<br> 
 * getTotalPage()<br> 
 * getTotalPageGroup()<br>
 * getNowPageGroup()<br>
 * getStartPageOfPageGroup()<br>
 * getEndPageOfPageGroup()<br> 
 * isPreviousPageGroup()<br>
 * isNextPageGroup()
 * 
 * @author kosta
 *
 */
public class PagingBean {
	/**
	 * 현재 페이지
	 */
	private int nowPage = 1;
	/**
	 * 페이지당 게시물수
	 */
	private int postCountPerPage = 5;
	/**
	 * 페이지 그룹당 페이지수
	 */
	private int pageCountPerPageGroup = 4;
	/**
	 * database에 저장된 총게시물수
	 */
	private int totalPostCount;

	public PagingBean() {
	}

	public PagingBean(int totalPostCount) {
		this.totalPostCount = totalPostCount;
	}

	public PagingBean(int totalPostCount, int nowPage) {
		this.totalPostCount = totalPostCount;
		this.nowPage = nowPage;
	}

	public int getNowPage() {
		return nowPage;
	}

	/**
	 * 현재 페이지번호에 해당하는 시작 게시물의 row number를 반환 <br>
	 * 
	 * 
	 * @return
	 */
	public int getStartRowNumber() {
		
		return ((nowPage-1) * postCountPerPage)+1;
	}

	/**
	 * 현재 페이지에서 보여줄 게시물 행(row)의 마지막 번호<br>
	 * 
	 * @return
	 */
	public int getEndRowNumber() {
		int endRow =nowPage * postCountPerPage;
		endRow =(totalPostCount < endRow) ? totalPostCount : endRow ;
		return endRow;
	}

	/**
	 * 총 페이지 수를 return한다.<br>
	 * @return
	 */
	public int getTotalPage() {		
		return totalPostCount;
	}

	/**
	 * 총 페이지 그룹의 수를 return한다.<br>
	 */
	private int getTotalPageGroup() {
		int totalPage=totalPostCount/postCountPerPage;
		totalPage = (totalPostCount % postCountPerPage ==0)? totalPage : totalPage+1;
		return totalPage;
	}

	/**
	 * 현재 페이지가 속한 페이지 그룹 번호(몇 번째 페이지 그룹인지) 을 return 하는 메소드 <br>
	 * 
	 * @return
	 */
	private int getNowPageGroup() {
		int pageGroup = nowPage / pageCountPerPageGroup;
		pageGroup = (nowPage%pageCountPerPageGroup==0)? pageGroup : pageGroup+1;
		return pageGroup;
	}

	/**
	 * 현재 페이지가 속한 페이지 그룹의 시작 페이지 번호를 return 한다.<br>
	 * 
	 * @return
	 */
	public int getStartPageOfPageGroup() {		
		return pageCountPerPageGroup * (getNowPageGroup()-1) +1;
	}

	/**
	 * 현재 페이지가 속한 페이지 그룹의 마지막 페이지 번호를 return 한다.<br>
	 * 
	 * @return
	 */
	public int getEndPageOfPageGroup() {
		int endGroup = pageCountPerPageGroup * getNowPageGroup();
		endGroup=(getTotalPageGroup() < endGroup)? getTotalPageGroup() : endGroup;
		return endGroup;
	}

	/**
	 * 이전 페이지 그룹이 있는지 체크하는 메서드 <br>	
	 * @return
	 */
	public boolean isPreviousPageGroup() {
		boolean flag = false;
		if(getNowPageGroup()>1) flag = true;
		return flag;
	}

	/**
	 * 다음 페이지 그룹이 있는지 체크하는 메서드 <br>	 
	 * @return
	 */
	public boolean isNextPageGroup() {
		boolean flag = false;
		if(getEndPageOfPageGroup() < getTotalPageGroup()) flag = true;
		return flag;
	}

}
