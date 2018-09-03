package marketController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MarketDAO;
import model.MarketVO;

public class MarketUpdatePostController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null||
				request.getMethod().equals("POST")==false){
			return "redirect:/template/layout.jsp";
		}
		int mNo=Integer.parseInt(request.getParameter("mNo"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		MarketVO mvo=new MarketVO();
		mvo.setMno(mNo);
		mvo.setTitle(title);
		mvo.setContent(content);
		MarketDAO.getInstance().updateMarket(mvo);
		String path="redirect:front?command=marketPostDetail&mno="+mvo.getMno();
		return path;
	}

}
