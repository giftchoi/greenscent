package diaryController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryListVO;
import model.PagingBean;

public class PublicDiarySearchController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PagingBean pb = null;
		String keyword =request.getParameter("keyword");
		int total = DiaryDAO.getInstance().getSearchPublicDiaryCount(keyword);
		if (request.getParameter("pageNo") != null) { 
			pb = new PagingBean(total, Integer.parseInt(request.getParameter("pageNo")));
		} else {
			pb = new PagingBean(total);
		}
		DiaryListVO lvo = new DiaryListVO(DiaryDAO.getInstance().getSearchPublicDiaryList(pb,keyword), pb);
		request.setAttribute("url", "/diary/diary_list.jsp");
		request.setAttribute("dList", lvo);
		request.setAttribute("postName", "publicDiaryList");
		return "/template/layout.jsp";
	}

}
