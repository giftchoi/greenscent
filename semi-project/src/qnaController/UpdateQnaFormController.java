package qnaController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.QnaDAO;
import model.QnaVO;

public class UpdateQnaFormController implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		int qNo=Integer.parseInt(request.getParameter("qNo"));
		QnaVO qvo=QnaDAO.getInstance().getQnaPostByNo(qNo);
		request.setAttribute("qvo", qvo);
		request.setAttribute("url", "/qna/qna_update_form.jsp");
		return "/template/layout.jsp";
	}
}
