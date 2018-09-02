package diaryController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryVO;

public class UpdateDiaryController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null||
				request.getMethod().equals("POST")==false){
			return "redirect:index.jsp";
		}*/ 
		//id 가져오기!!!!!!!!!!
		int dno=Integer.parseInt(request.getParameter("dno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int secret=Integer.parseInt(request.getParameter("secret"));
		DiaryVO dvo=new DiaryVO(dno,title,content,secret);
		DiaryDAO.getInstance().updateDiary(dvo);
		request.setAttribute("postName", "mydiary");
		return "front?command=diaryDetail&dno="+dno;
	}

}
