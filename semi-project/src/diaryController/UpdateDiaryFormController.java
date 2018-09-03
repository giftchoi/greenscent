package diaryController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryVO;

public class UpdateDiaryFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int dno=Integer.parseInt(request.getParameter("dno"));
		DiaryVO vo = DiaryDAO.getInstance().getDiaryDetail(dno);
		request.setAttribute("dvo", vo);
		request.setAttribute("url", "/diary/diary_updateForm.jsp");
		return "/template/layout.jsp";
	}

}
