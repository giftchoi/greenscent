package tipController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.TipDAO;

public class TipDeleteServerPictureController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String imgname=request.getParameter("fileName").trim();
		TipDAO.getInstance().deleteImgInDir(imgname);
		System.out.println(imgname);
		request.setAttribute("responsebody", imgname);
		return "AjaxView";
	}

}
