package qnaController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MemberVO;
import model.QnaDAO;
import model.QnaVO;
import model.TipDAO;

public class UpdateQnaController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "/qna/login_first.jsp";
		}
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int n_qNo=Integer.parseInt(request.getParameter("qNo"));
		String fileList[]=request.getParameterValues("pics");
		
		QnaDAO.getInstance().qnaUpdateImg(fileList, n_qNo);
			
		
		QnaVO qvo=new QnaVO();
		
		qvo.setTitle(title);
		qvo.setContent(content);
		qvo.setqNo(request.getParameter("qNo"));
		//qvo.setFileList(QnaDAO.getInstance().getQnaImgList(n_qNo));
		//QnaDAO.getInstance().qnaUpdate(qvo);
		
		request.setAttribute("qvo", qvo);
		String path="redirect:front?command=qnaDetail&qNo="+n_qNo;
		return path;
	}

}
