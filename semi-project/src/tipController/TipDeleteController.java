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
		if(session==null||session.getAttribute("mvo")==null||
				request.getMethod().equals("post")==false) {
			return "redirect:/template/layout.jsp";
		}
		String tno=request.getParameter("tno");
		TipDAO.getInstance().tipDelete(Integer.parseInt(tno));
		return "redirect:front?command=tipList";
	}

}
