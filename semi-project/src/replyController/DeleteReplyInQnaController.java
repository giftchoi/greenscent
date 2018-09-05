package replyController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ReplyDAO;

public class DeleteReplyInQnaController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String tno = request.getParameter("tno");
		String rno = request.getParameter("rno");
		
		ReplyDAO.getInstance().deleteReplyInQna(rno);
		
		return "redirect:front?command=qnaDetail&tNo="+tno;
	}

}
