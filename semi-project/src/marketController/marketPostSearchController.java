package marketController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MarketDAO;
import model.MarketListVO;
import model.MarketVO;
import model.PagingBean;

public class marketPostSearchController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		/*
		 * if (session == null || session.getAttribute("mvo") == null) { return
		 * "redirect:/template/layout.jsp"; }
		 */

		// TODO 수정더하기
		int totalMarketCount = MarketDAO.getInstance().getTotalMarketCount();
		String pageNo = request.getParameter("pageNo");
		PagingBean pagingBean = null;
		if (pageNo == null)
			pagingBean = new PagingBean(totalMarketCount);
		else
			pagingBean = new PagingBean(totalMarketCount, Integer.parseInt(pageNo));
		String search = request.getParameter("search");
		ArrayList<MarketVO> list = MarketDAO.getInstance().marketSearch(search, pagingBean);
		MarketListVO mlvo = new MarketListVO(list, pagingBean);
		request.setAttribute("mlvo", mlvo);
		request.setAttribute("url", "/market/market_list.jsp");

		return "/template/layout.jsp";
	}

}
