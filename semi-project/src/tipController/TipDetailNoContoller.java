package tipController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.ReplyDAO;
import model.ReplyVO;
import model.TipDAO;
import model.TipVO;

public class TipDetailNoContoller implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		int tno=Integer.parseInt(request.getParameter("tno"));
		TipVO tvo= TipDAO.getInstance().getTipPostByNo(tno);
		request.setAttribute("tvo", tvo);
		request.setAttribute("url", "/tip/tip_detail.jsp");
		
		
//TODO: TipDetailNoController reply구현------------------------------------------------
		ArrayList<ReplyVO> rvoList = new ArrayList<ReplyVO>();
		rvoList = ReplyDAO.getInstance().getTReplyListBytNo(tno);
		request.setAttribute("rvoList", rvoList);		
		
		return "/template/layout.jsp";
	}

}
