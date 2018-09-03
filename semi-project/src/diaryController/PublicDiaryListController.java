package diaryController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryVO;
import model.PagingBean;

public class PublicDiaryListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// int total=BoardDAO.getInstance().getTotalPostCount();
				// PagingBean pb = null;
				/*
				 * if(request.getParameter("pageNo") !=null) { pb = new
				 * PagingBean(total,Integer.parseInt(request.getParameter("pageNo"))); }else {
				 * pb = new PagingBean(total); } ListVO lvo=new
				 * ListVO(BoardDAO.getInstance().getPostingList(pb),pb);
				 */
				String id = "java";
				ArrayList<DiaryVO> dList = DiaryDAO.getInstance().getPublicDiaryList(new PagingBean(100));
				// request.setAttribute("url", "/board/list.jsp");
				request.setAttribute("dList", dList);
				request.setAttribute("postName", "sharediary");
				// return "/template/layout.jsp";
				return "/diary/diary_list.jsp";
	}

}
