package diaryController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.DiaryDAO;
import model.DiaryVO;
import model.MemberVO;

public class RegisterDiaryController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null||
				request.getMethod().equals("POST")==false){
			return "redirect:index.jsp";
		}
		String[] filelist = request.getParameterValues("pics");	
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int secret=Integer.parseInt(request.getParameter("secret"));
		MemberVO vo=(MemberVO)session.getAttribute("mvo");
		DiaryVO dvo=new DiaryVO(title,content,vo,secret);
		DiaryDAO.getInstance().registerDiary(dvo);
		if(filelist!=null) {
			for(int i=0;i<filelist.length;i++) {
				DiaryDAO.getInstance().registerImg(dvo.getDno(),filelist[i]);
			}
		}
		request.setAttribute("postName", "diaryList");
		return "redirect:front?command=diaryList";
	}

}
