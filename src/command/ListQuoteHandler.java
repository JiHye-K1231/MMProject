package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import quote.service.ListQuoteService;
import quote.service.QuotePage;

public class ListQuoteHandler implements CommandHandler{
	private ListQuoteService listQuoteService = new ListQuoteService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)throws Exception{
		String pageNoVal = req.getParameter("pageNo");
		int pageNo=1;
		if(pageNoVal !=null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		QuotePage quotePage = listQuoteService.getQuotePage(pageNo);
		req.setAttribute("quotePage", quotePage);
		return "/WEB-INF/view/listQuote.jsp";
		
	}

}
