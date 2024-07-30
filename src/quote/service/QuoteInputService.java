package quote.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import dao.QuoteDAO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.Quote;
import request.QuoteInputRequest;

public class QuoteInputService {
	private QuoteDAO quoteDao = new QuoteDAO();

	public Integer quoteInput(QuoteInputRequest req) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Quote quote = toQuote(req);
			Quote savedQuote = quoteDao.insert(conn, quote);
			if(savedQuote==null) {
				throw new RuntimeException("fail to insert quote");
			}
			conn.commit();
			 return savedQuote.getQuote_no();
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);			
		}catch(RuntimeException e) {
			JdbcUtil.rollback(conn);
			throw e;
		}finally {
			JdbcUtil.close(conn);
		}
	}
	 private Quote toQuote(QuoteInputRequest req) {
	        Date now = new Date();
	        return new Quote(
	            null,
	            req.getQuoteID(),
	            now, // QuoteDate
	            req.getQuoteNumber(),
	            req.getCustomerCode(),
	            req.getEmployeeCode(),
	            req.getProductCode(),
	            req.getValidityPeriod(),
	            req.getTotalAmount(),
	            req.getStatus(),
	            req.getCreatedVoucher()
	        );
	}
}
