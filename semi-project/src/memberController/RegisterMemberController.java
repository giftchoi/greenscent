package memberController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVO;


public class RegisterMemberController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id =  request.getParameter("id");
		String name =  request.getParameter("name");
		String password =  request.getParameter("password");
		String email =  request.getParameter("email");
		String birthday =  request.getParameter("birthday");
		MemberVO vo = new MemberVO(id, password, name, email, birthday, null);
		
		MemberDAO.getInstance().registerMember(vo);
		
		return "redirect:index.jsp";
	}

}
