package tipController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.TipDAO;

public class TipDeleteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null) {
			return "/tip/tipNotMvo.jsp";
		}

		String tNo = request.getParameter("tNo");
		ArrayList<String> list = TipDAO.getInstance().getTipImgList(Integer.parseInt(tNo));
		for (int i = 0; i < list.size(); i++) {
			TipDAO.getInstance().deleteImgInDir(list.get(i));
		}
		TipDAO.getInstance().tipDelete(Integer.parseInt(tNo));
		return "redirect:front?command=tipList";
	}

}
