package memberController;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MemberDAO;
import model.MemberVO;

public class LoginController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberVO mvo = MemberDAO.getInstance().login(new MemberVO(id,password,null));
		
		if(mvo!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("mvo", mvo);
			return "redirect:template/layout.jsp";
		}else {
			request.setAttribute("url", "/login_fail.jsp");
			return "/template/layout.jsp";
		}
	}

}
