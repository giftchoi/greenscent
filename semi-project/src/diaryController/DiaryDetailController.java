package diaryController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryVO;

public class DiaryDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		int dno=Integer.parseInt(request.getParameter("dno"));
		// 개별 게시물 조회  
		DiaryVO dvo = DiaryDAO.getInstance().getDiaryDetail(dno);	
		request.setAttribute("dvo", dvo);
		request.setAttribute("url", "/diary/diary_detail.jsp");
		request.setAttribute("postName", "diaryList");
		return "/template/layout.jsp";
	}

}
