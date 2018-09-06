package replyController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.ReplyDAO;
import model.ReplyVO;

public class WriteReplyInTipController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		String tno = request.getParameter("tno");
		String id = request.getParameter("id");
		String replycontent = request.getParameter("replycontent");
		ReplyVO rvo = new ReplyVO(null, tno, id, replycontent, null);
		
		ReplyDAO.getInstance().writeReplyInTip(rvo);
		//"${pageContext.request.contextPath}/front?command=tipDetail&tNo=${tlvo.tNo}"
		return "redirect:front?command=tipDetail&tNo="+tno;
	}

}
