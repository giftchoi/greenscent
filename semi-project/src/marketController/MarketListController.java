package marketController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MarketDAO;
import model.MarketListVO;
import model.MarketVO;
import model.PagingBean;
import model.TipListVO;

public class MarketListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int totalMarketCount=MarketDAO.getInstance().getTotalMarketCount();
		String pageNo=request.getParameter("pageNo");
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalMarketCount);
		else 
			pagingBean=new PagingBean(totalMarketCount, Integer.parseInt(pageNo));
		ArrayList<MarketVO> list = 
				MarketDAO.getInstance().getMarketList(pagingBean);
		// request.setAttribute("url", "/board/list.jsp");
		MarketListVO mlist=new MarketListVO(list,pagingBean);
		request.setAttribute("mlist", mlist);
		request.setAttribute("url", "/market/market_list.jsp");
		return "/template/layout.jsp";
	}

}
