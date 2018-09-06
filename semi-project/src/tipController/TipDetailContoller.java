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

public class TipDetailContoller implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null) {
			return "redirect:/template/layout.jsp";
		}
		int tNo = Integer.parseInt(request.getParameter("tNo"));
		@SuppressWarnings("unchecked")
		ArrayList<Integer> noList = (ArrayList<Integer>) session.getAttribute("noList");
		if (noList.contains(tNo) == false) {
			TipDAO.getInstance().updateHits(tNo);
			noList.add(tNo);
		}	
			
			TipVO tvo = TipDAO.getInstance().getTipPostByNo(tNo);
			
			tvo.setFileList(TipDAO.getInstance().getTipImgList(tNo));
			request.setAttribute("tvo", tvo);
			request.setAttribute("url", "/tip/tip_detail.jsp");

			
//TODO: TipDetailController reply구현------------------------------------------------
			ArrayList<ReplyVO> rvoList = new ArrayList<ReplyVO>();
			rvoList = ReplyDAO.getInstance().getTReplyListBytNo(tNo);
			request.setAttribute("rvoList", rvoList);			
			
		return "/template/layout.jsp";
	}

}
