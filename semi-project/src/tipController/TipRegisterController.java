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
		String fileList[]= request.getParameterValues("pics");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id=request.getParameter("id");
		TipVO tvo=new TipVO();
		tvo.setTitle(title);
		tvo.setContent(content);
		tvo.setMemberVO((MemberVO)session.getAttribute("mvo"));
		TipDAO.getInstance().tipPosting(tvo);
		if(fileList!=null) {
			TipDAO.getInstance().tipRegisterImg(tvo.gettNo(), fileList);
		}
		request.setAttribute("fileList", fileList);
		String path="redirect:front?command=tipList";
		return path;
	}

}
