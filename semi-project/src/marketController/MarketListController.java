package marketController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryVO;
import model.MarketDAO;
import model.MarketVO;
import model.PagingBean;

public class MarketListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = "java";
		System.out.println(0);
		ArrayList<MarketVO> mList = MarketDAO.getInstance().getMarketList(new PagingBean(100), id);
		// request.setAttribute("url", "/board/list.jsp");
		System.out.println(1);

		System.out.println(2);
		request.setAttribute("mlist", mList);
		
		request.setAttribute("url", "/market/market_list.jsp");
		return "/template/layout.jsp";
	}

}
