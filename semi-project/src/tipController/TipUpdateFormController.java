package tipController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.TipDAO;
import model.TipVO;

public class TipUpdateFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		int tNo=Integer.parseInt(request.getParameter("tno"));
		TipVO tvo=TipDAO.getInstance().getTipPostByNo(tNo);
		request.setAttribute("tvo", tvo);
		request.setAttribute("url", "/template/tip_updateForm.jsp");
		return "/template/layout.jsp";
	}

}
