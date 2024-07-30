package command;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import quote.service.QuoteInputService;
import request.QuoteInputRequest;

public class QuoteInputHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/WEB-INF/view/quoteInput.jsp";
	private QuoteInputService quoteInputService = new QuoteInputService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);// GET 요청일 경우 폼 처리 메서드 호출
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);// POST 요청일 경우 제출 처리 메서드 호출
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;// 허용되지 않은 HTTP 메서드일 경우 에러 응답
		}
	}
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		Map<String, Boolean> errors = new HashMap<>();// 오류 정보를 담는 Map 객체 생성
		req.setAttribute("errors", errors);// 오류 정보를 request에 저장
		
		QuoteInputRequest quoteInputReq = createQuoteInputRequest(req);
		quoteInputReq.validate(errors);
		
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		int newQuoteNo = quoteInputService.quoteInput(quoteInputReq);
		
		req.setAttribute("newQuoteNo", newQuoteNo);
	
		return "/WEB-INF/view/newQuoteSuccess.jsp";
}
	 private QuoteInputRequest createQuoteInputRequest(HttpServletRequest req) {
	        return new QuoteInputRequest(
	            req.getParameter("quoteID"),
	            new Date(), // 예시로 현재 날짜 사용, 필요에 따라 변경
	            req.getParameter("quoteNumber"),
	            req.getParameter("customerCode"),
	            req.getParameter("employeeCode"),
	            req.getParameter("productCode"),
	            new Date(), // 예시로 현재 날짜 사용, 필요에 따라 변경
	            Double.parseDouble(req.getParameter("totalAmount")),
	            req.getParameter("status"),
	            req.getParameter("createdVoucher")
	        );
	    }
	}