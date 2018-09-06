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
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		
		MemberVO vo = MemberDAO.getInstance().findMemberById(mvo.getId());
		request.setAttribute("findVO", vo);
		return "/member/member_update_form.jsp";

	}

}
