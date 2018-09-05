package diaryController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		int dno=Integer.parseInt(request.getParameter("dno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int secret=Integer.parseInt(request.getParameter("secret"));
		DiaryVO dvo=new DiaryVO(dno,title,content,secret);
		DiaryDAO.getInstance().updateDiary(dvo);
		String[] filelist = request.getParameterValues("pics");
		DiaryDAO.getInstance().updateDiaryImg(dno,filelist);
		request.setAttribute("postName", "diaryList");
		return "front?command=diaryDetail&dno="+dno;
	}

}
