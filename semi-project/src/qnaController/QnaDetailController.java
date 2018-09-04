package qnaController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.QnaDAO;
import model.QnaVO;

public class QnaDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int qNo = Integer.parseInt(request.getParameter("qNo"));
			QnaVO qvo = QnaDAO.getInstance().getQnaPostByNo(qNo);
			request.setAttribute("qvo", qvo);
			request.setAttribute("url", "/qna/qna_detail.jsp");
		
		return "/template/layout.jsp";
	
	}

}
