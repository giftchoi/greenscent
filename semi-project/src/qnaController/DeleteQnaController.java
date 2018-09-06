package qnaController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.QnaDAO;

public class DeleteQnaController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:/template/layout.jsp";
		}
		ArrayList<String> list=new ArrayList<String>();
		String qNo= request.getParameter("qNo");
		int n_qno=Integer.parseInt(qNo);
		list=QnaDAO.getInstance().getQnaImgList(n_qno);
		if(list!=null) {
			for(int i=0;i<list.size();i++) {
				QnaDAO.getInstance().deleteImgInDir(list.get(i));
			}
		}
		
		QnaDAO.getInstance().deleteQna(qNo);
		return "redirect:front?command=qnaList";
	}

}
