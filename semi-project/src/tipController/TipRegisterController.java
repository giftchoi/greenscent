package tipController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MemberVO;
import model.TipDAO;
import model.TipVO;

public class TipRegisterController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		/*if(session==null||session.getAttribute("mvo")==null){
			return "redirect:main.jsp";
		}*/
		String id=request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		TipVO tvo=new TipVO();
		tvo.setTitle(title);
		tvo.setContent(content);
		tvo.setMemberVO((MemberVO)session.getAttribute("mvo"));
		TipDAO.getInstance().tipPosting(tvo);
		String path="redirect:front?command=tipDetail&tNo="+tvo.gettNo();
		return path;
	}

}
