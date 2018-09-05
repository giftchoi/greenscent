package diaryController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryVO;
import model.ReplyDAO;
import model.ReplyVO;

public class PublicDiaryDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:diary/login_need.jsp";
		}
		int dno=Integer.parseInt(request.getParameter("dno"));
		// 개별 게시물 조회  
		DiaryVO dvo = DiaryDAO.getInstance().getDiaryDetail(dno);	
		request.setAttribute("dvo", dvo);
		request.setAttribute("url", "/diary/_detail.jsp");
		request.setAttribute("postName", "publicDiaryList");
		
		
//TODO: PublicDiaryDetailController reply구현------------------------------------------------
		ArrayList<ReplyVO> rvoList = new ArrayList<ReplyVO>();
		rvoList = ReplyDAO.getInstance().getTReplyListBytNo(dno);
		request.setAttribute("rvoList", rvoList);	
		
		return "/template/layout.jsp";
	}

}
