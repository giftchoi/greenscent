package tipController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.TipDAO;

public class TipDeleteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:/template/layout.jsp";
		}
		
		String tNo=request.getParameter("tNo");
		TipDAO.getInstance().tipDelete(Integer.parseInt(tNo));
		return "redirect:front?command=tipList";
	}

}
