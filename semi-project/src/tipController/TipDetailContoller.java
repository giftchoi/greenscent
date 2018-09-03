package tipController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.TipDAO;
import model.TipVO;

public class TipDetailContoller implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null) {
			return "redirect:/template/layout.jsp";
		}
		int tNo = Integer.parseInt(request.getParameter("no"));
		@SuppressWarnings("unchecked")
		ArrayList<Integer> noList = (ArrayList<Integer>) session.getAttribute("noList");
		if (noList.contains(tNo) == false) {
			TipDAO.getInstance().updateHits(tNo);
			noList.add(tNo);
		}
		TipVO tvo= TipDAO.getInstance().getTipPostByNo(tNo);
		request.setAttribute("tvo", tvo);
		request.setAttribute("url", "/tip/tip_detail.jsp");
		
		return "/template/layout.jsp";
	}

}
