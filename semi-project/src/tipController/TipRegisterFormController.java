package tipController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;

public class TipRegisterFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session=request.getSession(false);
			if(session==null||session.getAttribute("mvo")==null) {
				return "/tip/tipNotMvo.jsp";
			}
		
		request.setAttribute("url", "/tip/tipRegisterForm.jsp");
		return "/template/layout.jsp";
	}

}
