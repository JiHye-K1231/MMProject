<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<title>견적서 조회</title>
</head>
<body>

	<table border="1">
		<tr>
			<td colspan="4"><a href="quoteInput.do">[견적서 작성]</a></td>
		</tr>
		<tr>
		<td>체크박스</td>
			<td>일자</td>
			<td>거래처명</td>
			<td>담당자명</td>
			<td>품목명</td>
			<td>유효기간</td>
			<td>견적금액합계</td>
			<td>진행상태</td>
			<td>생성한 전표</td>
			<td>인쇄</td>
		</tr>
		<c:if test="${quotePage.hasNoArticles()}">
			<tr>
				<td colspan="4">견적서가 없습니다.</td>
			</tr>
			</c:if>
			<c:forEach var="quote" items="${quotePage.content }">
			<tr>
			 <td><input type="checkbox" class="rowCheck" aria-label="선택"></td>
                                    <td>${quote.quoteDate}</td>
                                    <td>${quote.customerCode}</td>
                                    <td>${quote.employeeCode}</td>
                                    <td>${quote.productCode}</td>
                                    <td>${quote.validityPeriod}</td>
                                    <td>${quote.totalAmount}</td>
                                    <td>${quote.status}</td>
                                    <td>${quote.createdVoucher}</td>
                                    <td><button class="btn btn-secondary">인쇄</button></td>
			</c:forEach>
			<c:if test="${quotePage.hasArticles()}">
			<tr>
			<td colspan="4">
			<c:if test="${quotePage.startPage > 5}">
			<a href="quoteList.do?pageNo=${quotePage.startPage - 5}">[이전]</a>
			</c:if>
			<c:forEach var="pNo"
			begin="${quotePage.startPage}"
			end="${quotePage.endPage}">
			<a href="quoteList.do?pageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${quotePage.endPage < quotePage.totalPages}">
			<a href="quoteList.do?pageNo=${quotePage.startPage + 5}">[다음]</a>
			</c:if>
			</td>
			</tr>
			</c:if>
			
	</table>

</body>
</html>