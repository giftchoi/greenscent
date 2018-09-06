package replyController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.ReplyDAO;

public class DeleteReplyInDiaryController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		String dno = request.getParameter("dno");
		String rno = request.getParameter("rno");
		
		ReplyDAO.getInstance().deleteReplyInDiary(rno);
		
		return "redirect:front?command=publicDiaryDetail&dno="+dno;
	}

}
