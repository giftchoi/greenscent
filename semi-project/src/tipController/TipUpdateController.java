package tipController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.TipDAO;
import model.TipVO;

public class TipUpdateController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null||
				request.getMethod().equals("POST")==false){
			return "redirect:/template/layout.jsp";
		}
		int tNo=Integer.parseInt(request.getParameter("tNo"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		TipVO tvo=new TipVO();
		tvo.settNo(tNo);
		tvo.setTitle(title);
		tvo.setContent(content);
		TipDAO.getInstance().tipUpdate(tvo);
		String path="redirect:front?command=tipDetail&tno="+tvo.gettNo();
		return path;
	}

}
