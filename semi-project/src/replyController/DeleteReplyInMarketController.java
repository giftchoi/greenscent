package replyController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.ReplyDAO;

public class DeleteReplyInMarketController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		String mno = request.getParameter("mno");
		String rno = request.getParameter("rno");
		
		ReplyDAO.getInstance().deleteReplyInMarket(rno);
		
		return "redirect:front?command=marketPostDetail&mno="+mno;
	}

}
