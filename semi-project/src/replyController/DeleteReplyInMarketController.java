package replyController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ReplyDAO;

public class DeleteReplyInMarketController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String mno = request.getParameter("mno");
		String rno = request.getParameter("rno");
		
		ReplyDAO.getInstance().deleteReplyInMarket(rno);
		
		return "redirect:front?command=marketPostDetail&mno="+mno;
	}

}
