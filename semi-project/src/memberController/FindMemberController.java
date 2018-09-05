package memberController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVO;

public class FindMemberController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		MemberVO mvo=MemberDAO.getInstance().findMemberById(id);
		String result=null;
		if(mvo==null)
			result="가능한 아이디입니다";
		else
			result="사용중인 아이디입니다. 다른 아이디를 입력하세요";
		//클라이언트에게 ajax 방식으로 응답할 정보를 할당한다 
		request.setAttribute("responsebody", result);
		//AjaxView를 리턴해서 Ajax 방식으로 페이지가 아니라 
		//필요한 데이터만 응답하도록 한다 
		return "AjaxView";
	}

}
