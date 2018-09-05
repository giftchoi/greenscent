package tipController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.PagingBean;
import model.TipDAO;
import model.TipListVO;
import model.TipVO;

public class TipListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
			int totalTipCount=TipDAO.getInstance().getTotalTipCount();
			String pageNo=request.getParameter("pageNo");
			PagingBean pagingBean = null;
			if(pageNo==null)
				pagingBean=new PagingBean(totalTipCount);
			else 
				pagingBean=new PagingBean(totalTipCount, Integer.parseInt(pageNo));
			
			ArrayList<TipVO> list
			=TipDAO.getInstance().tipList(pagingBean);
			TipListVO tlvo=new TipListVO(list,pagingBean);
			request.setAttribute("tlvo", tlvo);
			request.setAttribute("url","/tip/tip_list.jsp" );
			return "/template/layout.jsp"; 
	}

}
