package quote.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import dao.QuoteDAO;
import jdbc.connection.ConnectionProvider;
import model.Quote;

public class ListQuoteService {
	private QuoteDAO quoteDao = new QuoteDAO();
	private int size = 10;

	
	public QuotePage getQuotePage(int pageNum) {
		int firstRow = 0; // 페이지의 첫 번째 행 번호
		int endRow = 0; // 페이지의 마지막 행 번호
		List<Quote> content = null; // 페이지의 게시글 목록
		
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = quoteDao.selectCount(conn); // 전체 게시글 수 가져오기

			if (total > 0) {
				// 페이지에 따른 첫 번째 행과 마지막 행 계산
				firstRow = (pageNum - 1) * size + 1;
				endRow = firstRow + size - 1;

				// 해당 페이지의 게시글 목록 가져오기
				content = quoteDao.select(conn, firstRow, endRow);
			}
			return new QuotePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}


