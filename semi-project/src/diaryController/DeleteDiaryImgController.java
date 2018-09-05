package diaryController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.DiaryDAO;

public class DeleteDiaryImgController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String filename=request.getParameter("fileName");
		System.out.println(filename);
		DiaryDAO.getInstance().deleteImgInDir(filename);
		request.setAttribute("responsebody","success");
		return "AjaxView";
	}

}
