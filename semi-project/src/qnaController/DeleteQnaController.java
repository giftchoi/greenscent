package qnaController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.QnaDAO;

public class DeleteQnaController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:/template/layout.jsp";
		}
		String qNo= request.getParameter("qNo");
		QnaDAO.getInstance().deleteQna(qNo);
		return "redirect:front?command=qnaList";
	}

}
