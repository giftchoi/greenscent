package diaryController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.DiaryDAO;

public class DeleteDiaryController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null||
				request.getMethod().equals("POST")==false){
			return "redirect:index.jsp";
		}*/
		String dno=request.getParameter("dno");
		DiaryDAO.getInstance().deleteDiary(Integer.parseInt(dno));
		// 게시물 목록을 보여주기 위해
		// path를 front?command=list setting하고
		// 리다이렉트 방식으로 이동시킨다. 
		request.setAttribute("postName", "diaryList");
		return "redirect:front?command=diaryList";
	}

}
