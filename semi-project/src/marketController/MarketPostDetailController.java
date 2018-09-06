package marketController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MarketDAO;
import model.MarketVO;
import model.ReplyDAO;
import model.ReplyVO;

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
		
//TODO: MarketPostDetailController reply구현------------------------------------------------
		ArrayList<ReplyVO> rvoList = new ArrayList<ReplyVO>();
		rvoList = ReplyDAO.getInstance().getMReplyListBymNo(mno);
		request.setAttribute("rvoList", rvoList);	
		
		return "/template/layout.jsp";
		//return "/market/market_detail.jsp";
	}

}
