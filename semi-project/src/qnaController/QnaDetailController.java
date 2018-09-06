package qnaController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.QnaDAO;
import model.QnaVO;
import model.ReplyDAO;
import model.ReplyVO;
import model.TipDAO;

public class QnaDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int qNo = Integer.parseInt(request.getParameter("qNo"));
			QnaVO qvo = QnaDAO.getInstance().getQnaPostByNo(qNo);
			qvo.setFileList(QnaDAO.getInstance().getQnaImgList(qNo));
			request.setAttribute("qvo", qvo);
			System.out.println(qvo.getFileList());
			request.setAttribute("url", "/qna/qna_detail.jsp");
			
		
			
//TODO: MarketPostDetailController reply구현------------------------------------------------
		ArrayList<ReplyVO> rvoList = new ArrayList<ReplyVO>();
		rvoList = ReplyDAO.getInstance().getQReplyListByqNo(qNo);
		request.setAttribute("rvoList", rvoList);

		return "/template/layout.jsp";
	
	}

}
