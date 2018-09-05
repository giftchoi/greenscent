package memberController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;

public class MemberCheckController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String check=MemberDAO.getInstance().memberCheck(id, password);
		String result=null;
		if(check.equals("memberOK"))
			result="loginok";
		else
			result="아이디와 비밀번호를 확인하세요";
		//클라이언트에게 ajax 방식으로 응답할 정보를 할당한다 
		request.setAttribute("responsebody", result);
		//AjaxView를 리턴해서 Ajax 방식으로 페이지가 아니라 
		//필요한 데이터만 응답하도록 한다 
		return "AjaxView";
	}

}
