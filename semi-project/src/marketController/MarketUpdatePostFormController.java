package marketController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MarketDAO;
import model.MarketVO;


public class MarketUpdatePostFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		int mno=Integer.parseInt(request.getParameter("mno"));
		MarketVO mvo=MarketDAO.getInstance().getMarketPostByNo(mno);
		request.setAttribute("mvo", mvo);
		request.setAttribute("url", "/market/market_updateForm.jsp");
		return "/template/layout.jsp";
	}
}
