package diaryController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryListVO;
import model.DiaryVO;
import model.PagingBean;

public class PublicDiaryListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// int total=BoardDAO.getInstance().getTotalPostCount();
		PagingBean pb = null;
		int total = DiaryDAO.getInstance().getTotalPublicDiaryCount();
		if (request.getParameter("pageNo") != null) {
			pb = new PagingBean(total, Integer.parseInt(request.getParameter("pageNo")));
		} else {
			pb = new PagingBean(total);
		}
		DiaryListVO lvo = new DiaryListVO(DiaryDAO.getInstance().getPublicDiaryList(pb), pb);
		request.setAttribute("url", "/diary/diary_list.jsp");
		request.setAttribute("dList", lvo);
		request.setAttribute("postName", "publicDiaryList");
		return "/template/layout.jsp";

	}

}
