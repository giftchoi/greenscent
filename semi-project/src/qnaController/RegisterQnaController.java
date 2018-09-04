package qnaController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MemberVO;
import model.QnaDAO;
import model.QnaVO;

public class RegisterQnaController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		
		String id=request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		QnaVO qvo=new QnaVO();
		
		qvo.setTitle(title);
		qvo.setContent(content);
		qvo.setMvo((MemberVO)session.getAttribute("mvo"));
		QnaDAO.getInstance().qnaPosting(qvo);
		int n_qno=Integer.parseInt(qvo.getqNo());
		String path="redirect:front?command=qnaDetail&qNo="+n_qno ;
		return path;
	}

}
