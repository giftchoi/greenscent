package tipController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.PagingBean;
import model.TipDAO;
import model.TipListVO;
import model.TipVO;

public class tipPostSearchController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null) {
			return "/tip/tipNotMvo.jsp";
		}
		int totalTipCount=TipDAO.getInstance().getTotalTipCount();
		String pageNo=request.getParameter("pageNo");
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalTipCount);
		else 
			pagingBean=new PagingBean(totalTipCount, Integer.parseInt(pageNo));
		String search=request.getParameter("search");
		ArrayList<TipVO> list=TipDAO.getInstance().tipPostSearch(search, pagingBean);
			TipListVO tlvo=new TipListVO(list,pagingBean);
			request.setAttribute("tlvo", tlvo);
			request.setAttribute("url", "/tip/tip_list.jsp");
		
		return "/template/layout.jsp";
	}
}
