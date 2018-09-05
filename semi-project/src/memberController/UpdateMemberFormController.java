package memberController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MemberDAO;
import model.MemberVO;

public class UpdateMemberFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String viewPath=null;
		if(session!=null && mvo!=null) {
			MemberVO vo = MemberDAO.getInstance().findMemberById(mvo.getId());
			request.setAttribute("findVO", vo);
			viewPath = "/member/member_update_form.jsp";
		} else
			viewPath = "/index.jsp";
		
		return viewPath;
	}

}
