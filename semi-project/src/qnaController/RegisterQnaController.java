package qnaController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MemberVO;
import model.QnaDAO;
import model.QnaVO;
import model.TipDAO;

public class RegisterQnaController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		System.out.println(1);
		String fileList[]= request.getParameterValues("pics");
		String id=request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		QnaVO qvo=new QnaVO();
		
		qvo.setTitle(title);
		qvo.setContent(content);
		qvo.setMvo((MemberVO)session.getAttribute("mvo"));
		QnaDAO.getInstance().qnaPosting(qvo);
		System.out.println(3);
		int n_qno=Integer.parseInt(qvo.getqNo());
		if(fileList!=null) {
			System.out.println(4);
			QnaDAO.getInstance().qnaRegisterImg(n_qno, fileList);
			System.out.println(5);
		}
		request.setAttribute("fileList", fileList);
		String path="redirect:front?command=qnaList" ;
		return path;
	}

}
