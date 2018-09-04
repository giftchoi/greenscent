package diaryController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryListVO;
import model.MemberVO;
import model.PagingBean;

public class DiarySearchController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		String id=((MemberVO)session.getAttribute("mvo")).getId();
		String keyword =request.getParameter("keyword");
		PagingBean pb = null;
		int total = DiaryDAO.getInstance().getSearchMyDiaryCount(id,keyword);
		if (request.getParameter("pageNo") != null) {
			pb = new PagingBean(total, Integer.parseInt(request.getParameter("pageNo")));
		} else {
			pb = new PagingBean(total);
		}
		//System.out.println(keyword);
		DiaryListVO lvo = new DiaryListVO(DiaryDAO.getInstance().getSearchMyDiaryList(pb,id,keyword), pb);
		request.setAttribute("url", "/diary/diary_list.jsp");
		request.setAttribute("dList", lvo);
		request.setAttribute("postName", "diaryList");
		return "/template/layout.jsp";
	}

}
