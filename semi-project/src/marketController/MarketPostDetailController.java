package marketController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MarketDAO;
import model.MarketVO;
import model.TipDAO;

public class MarketPostDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int mno=Integer.parseInt(request.getParameter("mno"));
		// 개별 게시물 조회  
		MarketVO mvo = MarketDAO.getInstance().getMarketDetail(mno);	
		mvo.setFilelist(MarketDAO.getInstance().getMarketImgList(mno));

		request.setAttribute("mvo", mvo);
		request.setAttribute("url", "/market/market_detail.jsp");
		return "/template/layout.jsp";
		//return "/market/market_detail.jsp";
	}

}
