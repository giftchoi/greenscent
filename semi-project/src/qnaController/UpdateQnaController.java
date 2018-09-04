package qnaController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MemberVO;
import model.QnaDAO;
import model.QnaVO;

public class UpdateQnaController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:/template/layout.jsp";
		}
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int n_qNo=Integer.parseInt(request.getParameter("qNo"));
		
		QnaVO qvo=new QnaVO();
		MemberVO mvo=new MemberVO();
		qvo.setTitle(title);
		qvo.setContent(content);
		qvo.setqNo(request.getParameter("qNo"));
		QnaDAO.getInstance().qnaUpdate(qvo);
		String path="redirect:front?command=qnaDetail&qNo="+n_qNo;
		return path;
	}

}
