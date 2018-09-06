package replyController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ReplyDAO;

public class DeleteReplyInDiaryController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String dno = request.getParameter("dno");
		String rno = request.getParameter("rno");
		
		ReplyDAO.getInstance().deleteReplyInTip(rno);
		
		return "redirect:front?command=publicDiaryDetail&dno="+dno;
	}

}
