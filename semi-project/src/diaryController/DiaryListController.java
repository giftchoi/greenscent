package diaryController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryListVO;
import model.DiaryVO;
import model.MemberVO;
import model.PagingBean;

public class DiaryListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		String id=((MemberVO)session.getAttribute("mvo")).getId();
		PagingBean pb = null;
		int total = DiaryDAO.getInstance().getTotalMyDiaryCount(id);
		if (request.getParameter("pageNo") != null) {
			pb = new PagingBean(total, Integer.parseInt(request.getParameter("pageNo")));
		} else {
			pb = new PagingBean(total);
		}
		DiaryListVO lvo = new DiaryListVO(DiaryDAO.getInstance().getMyDiaryList(pb,id), pb);
		request.setAttribute("url", "/diary/diary_list.jsp");
		request.setAttribute("dList", lvo);
		request.setAttribute("postName", "diaryList");
		return "/template/layout.jsp";
	}

}
