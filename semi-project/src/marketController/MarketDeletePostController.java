package marketController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.MarketDAO;

public class MarketDeletePostController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null/*||
				request.getMethod().equals("post")==false*/) {
			return "redirect:/template/layout.jsp";
		}
		String mno=request.getParameter("mno");
		MarketDAO.getInstance().deleteMarket(Integer.parseInt(mno));
		return "redirect:front?command=marketList";
	}

}
