package marketController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.DiaryDAO;
import model.MarketDAO;
import model.MarketVO;
import model.TipDAO;

public class MarketUpdatePostController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null||
				request.getMethod().equals("POST")==false){
			return "redirect:/template/layout.jsp";
		}
		int mno=Integer.parseInt(request.getParameter("mno"));
		int state=Integer.parseInt(request.getParameter("state"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String fileList[]=request.getParameterValues("pics");
		MarketVO mvo=new MarketVO();
		mvo.setMno(mno);
		mvo.setTitle(title);
		mvo.setContent(content);
		mvo.setState(state);
		mvo.setFilelist(MarketDAO.getInstance().getMarketImgList(mno));
		MarketDAO.getInstance().updateDiaryImg(mno,fileList);

	
		MarketDAO.getInstance().updateMarket(mvo);
		String path="redirect:front?command=marketPostDetail&mno="+mvo.getMno();
		return path;
	}

}
