package qnaController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;

public class RegisterQnaFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			return "/qna/login_first.jsp";
		}
	request.setAttribute("url", "/qna/qnaRegisterForm.jsp");
	return "/template/layout.jsp";
	}

}
