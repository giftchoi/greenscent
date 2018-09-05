package replyController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ReplyDAO;

public class DeleteReplyInQnaController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String qno = request.getParameter("qno");
		String rno = request.getParameter("rno");
		
		ReplyDAO.getInstance().deleteReplyInQna(rno);
		
		return "redirect:front?command=qnaDetail&qNo="+qno;
	}

}
