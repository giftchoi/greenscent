package memberController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MemberDAO;
import model.MemberVO;

public class DeleteMemberController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null) {
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			MemberDAO.getInstance().deleteMember(mvo);
			session.invalidate();
		}
		return "redirect:front?command=home";
	}

}
