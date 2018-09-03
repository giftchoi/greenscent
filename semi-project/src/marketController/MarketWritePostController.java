package marketController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryVO;
import model.MarketDAO;
import model.MarketVO;
import model.MemberVO;

public class MarketWritePostController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String[] filelist = request.getParameterValues("pics");	
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id ="story";
		MarketVO mvo=new MarketVO(title,content,new MemberVO(id,null,null),0, 0, filelist);
		MarketDAO.getInstance().registerMarket(mvo);
		return "front?command=marketList";
	}
}
