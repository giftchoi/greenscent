package replyController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ReplyDAO;
import model.ReplyVO;

public class WriteReplyInDiaryController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String dno = request.getParameter("dno");
		String id = request.getParameter("id");
		String replycontent = request.getParameter("replycontent");
		ReplyVO rvo = new ReplyVO(null, dno, id, replycontent, null);
		
		ReplyDAO.getInstance().writeReplyInDiary(rvo);
		//"${pageContext.request.contextPath}/front?command=tipDetail&tNo=${tlvo.tNo}"
		return "redirect:front?command=publicDiaryDetail&dno="+dno;
	}

}
