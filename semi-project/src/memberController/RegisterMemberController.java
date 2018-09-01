package memberController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryVO;
import model.MemberVO;

public class RegisterMemberController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null||
				request.getMethod().equals("POST")==false){
			return "redirect:index.jsp";
		}*/ 
		//id 가져오기!!!!!!!!!!
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id ="story";
		DiaryVO dvo=new DiaryVO(title,content,new MemberVO(id,null,null),false);
		DiaryDAO.getInstance().registerDiary(dvo);
		return "index.jsp";
	}

}
