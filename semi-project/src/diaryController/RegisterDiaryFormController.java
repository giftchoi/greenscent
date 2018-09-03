package diaryController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class RegisterDiaryFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("url", "/diary/diary_RegisterForm.jsp");
		return "/template/layout.jsp";
	}

}
