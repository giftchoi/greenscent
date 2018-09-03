package marketController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.TipDAO;
import model.TipVO;

public class MarketUpdatePostFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		int mno=Integer.parseInt(request.getParameter("mno"));
		TipVO mvo=TipDAO.getInstance().getTipPostByNo(mno);
		request.setAttribute("mvo", mvo);
		request.setAttribute("url", "/template/market_updateForm.jsp");
		return "/template/layout.jsp";
	}
}
