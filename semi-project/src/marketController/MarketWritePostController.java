package marketController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryVO;
import model.MarketDAO;
import model.MarketVO;
import model.MemberVO;

public class MarketWritePostController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:main.jsp";
		}
//		
//		String id=request.getParameter("id");
//		String[] filelist = request.getParameterValues("pics");	
		String title = request.getParameter("title");
		String content = request.getParameter("content");
//		int state = Integer.parseInt(request.getParameter("state"));

//		MarketVO mvo=new MarketVO(title,content,new MemberVO(id,null,null),0, 0, filelist);
		MarketVO mvo=new MarketVO();
		mvo.setTitle(title);
		mvo.setContent(content);
		mvo.setState(0);
		mvo.setMemberVO((MemberVO)session.getAttribute("mvo"));
		MarketDAO.getInstance().registerMarket(mvo);
		//request.setAttribute("url", "/template/main.jsp");

		String path="redirect:front?command=marketPostDetail&mno="+mvo.getMno();
		return path;
	}
}
