package marketController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MarketDAO;
import model.MarketVO;
import model.PagingBean;

public class MarketListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String id = "java";
		int totalMarketCount=MarketDAO.getInstance().getTotalMarketCount();
		String pageNo=request.getParameter("pageNo");
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalMarketCount);
		else 
			pagingBean=new PagingBean(totalMarketCount, Integer.parseInt(pageNo));
		ArrayList<MarketVO> mlist = 
				MarketDAO.getInstance().getMarketList(pagingBean);
		// request.setAttribute("url", "/board/list.jsp");

		request.setAttribute("mlist", mlist);
		request.setAttribute("url", "/market/market_list.jsp");
		return "/template/layout.jsp";
	}

}
