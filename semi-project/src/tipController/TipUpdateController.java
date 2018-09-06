package tipController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MemberVO;
import model.TipDAO;
import model.TipVO;

public class TipUpdateController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:/template/layout.jsp";
		}
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int tNo=Integer.parseInt(request.getParameter("tNo"));
		String fileList[]=request.getParameterValues("pics");
		if(fileList!=null) {
			TipDAO.getInstance().tipUpdateImg(fileList, tNo);
		}
		TipVO tvo=new TipVO();
		tvo.setTitle(title);
		tvo.setContent(content);
		tvo.settNo(tNo);
		TipDAO.getInstance().tipUpdate(tvo);
		
		//System.out.println(fileList[0]);
		//TipDAO.getInstance().tipUpdateImg(fileList,tNo);
		request.setAttribute("tvo", tvo);
		
		String path="redirect:front?command=tipDetail&tNo="+tvo.gettNo();
		return path;
	}

}
