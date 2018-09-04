package qnaController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.PagingBean;
import model.QnaDAO;
import model.QnaListVO;
import model.QnaVO;


public class QnaListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int totalQnaCount=QnaDAO.getInstance().getTotalQnaCount();
		String pageNo=request.getParameter("pageNo");
		PagingBean pagingBean = null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalQnaCount);
		else 
			pagingBean=new PagingBean(totalQnaCount, Integer.parseInt(pageNo));
		ArrayList<QnaVO> list =QnaDAO.getInstance().qnaList(pagingBean);
		QnaListVO qlvo=new QnaListVO(list,pagingBean);
		request.setAttribute("qlvo", qlvo);
		request.setAttribute("url","/qna/qna_list.jsp" );
		return "/template/layout.jsp"; 
	}
}
