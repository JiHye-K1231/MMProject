<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<title>견적서 입력</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
        /* 기본 레이아웃 스타일 */
        body {
            display: flex; /* Flexbox를 사용하여 레이아웃 구성 */
            min-height: 100vh; /* 최소 높이를 화면 전체로 설정 */
            margin: 0; /* 기본 여백 제거 */
        }

        .accordion-container {
            width: 250px; /* 사이드바 너비 설정 */
            background-color: #f8f9fa; /* 배경색 설정 */
            padding: 10px; /* 여백 추가 */
            position: fixed; /* 고정 위치 설정 */
            height: 100%; /* 화면 높이에 맞춤 */
            overflow-y: auto; /* 세로 스크롤 추가 */
        }

        .main-content {
            margin-left: 250px; /* 사이드바 너비만큼 여백 추가 */
            padding: 20px; /* 여백 추가 */
            width: calc(100% - 250px); /* 사이드바를 제외한 너비 설정 */
        }

        .clickable-item {
            display: block; /* 블록 레벨 요소로 설정 */
            padding: 10px; /* 여백 추가 */
            margin-bottom: 5px; /* 하단 여백 추가 */
            background-color: #e9ecef; /* 배경색 설정 */
            border: 1px solid #dee2e6; /* 테두리 설정 */
            border-radius: 5px; /* 모서리 둥글게 */
            text-decoration: none; /* 링크 기본 스타일 제거 */
            color: #000; /* 텍스트 색상 설정 */
        }

        .clickable-item:hover {
            background-color: #d8d8d8; /* 호버 시 배경색 변경 */
        }
    </style>
</head>
<body>
<div class="accordion-container">
        <div class="accordion" id="accordionPanelsStayOpenExample">
            <!-- 견적서 -->
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#quoteAccordion" aria-expanded="true" aria-controls="quoteAccordion">
                       견적서
                    </button>
                </h2>
                <div id="quoteAccordion" class="accordion-collapse collapse show">
                    <div class="accordion-body">
                        <a href="${pageContext.request.contextPath}/quoteList.do" class="clickable-item">견적서 조회</a>
                        <a href="${pageContext.request.contextPath}/quoteInput.do"class="clickable-item">견적서 입력</a>
                        <a href="${pageContext.request.contextPath}/quoteStatus" class="clickable-item">견적서 현황</a>
                        <a href="${pageContext.request.contextPath}/unorderedStatus" class="clickable-item">미주문 현황</a>
                    </div>
                </div>
            </div>
            <!-- 주문서 -->
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#orderAccordion" aria-expanded="false" aria-controls="orderAccordion">
                       주문서
                    </button>
                </h2>
                <div id="orderAccordion" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <a href="${pageContext.request.contextPath}/orderView" class="clickable-item">주문서 조회</a>
                        <a href="${pageContext.request.contextPath}/orderInput" class="clickable-item">주문서 입력</a>
                        <a href="${pageContext.request.contextPath}/orderStatus" class="clickable-item">주문서 현황</a>
                        <a href="${pageContext.request.contextPath}/orderShipping" class="clickable-item">주문서 출고처리</a>
                        <a href="${pageContext.request.contextPath}/unsoldStatus" class="clickable-item">미판매현황</a>
                    </div>
                </div>
            </div>
            <!-- 판매 -->
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#salesAccordion" aria-expanded="false" aria-controls="salesAccordion">
                        판매
                    </button>
                </h2>
                <div id="salesAccordion" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <a href="${pageContext.request.contextPath}/salesView" class="clickable-item">판매 조회</a>
                        <a href="${pageContext.request.contextPath}/salesInput" class="clickable-item">판매 입력</a>
                        <a href="${pageContext.request.contextPath}/salesInput2" class="clickable-item">판매 입력2</a>
                        <a href="${pageContext.request.contextPath}/salesPriceChange" class="clickable-item">판매단가 일관변경</a>
                        <a href="${pageContext.request.contextPath}/salesStatus" class="clickable-item">판매 현황</a>
                        <a href="${pageContext.request.contextPath}/paymentView" class="clickable-item">결제 내역 조회</a>
                        <a href="${pageContext.request.contextPath}/paymentComparison" class="clickable-item">결제 내역 자료비교</a>
                    </div>
                </div>
            </div>
            <!-- 출하지시서 -->
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#shipmentOrderAccordion" aria-expanded="false" aria-controls="shipmentOrderAccordion">
                       출하지시서
                    </button>
                </h2>
                <div id="shipmentOrderAccordion" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <a href="${pageContext.request.contextPath}/shipmentOrderView" class="clickable-item">출하지시서 조회</a>
                        <a href="${pageContext.request.contextPath}/shipmentOrderInput" class="clickable-item">출하지시서 입력</a>
                        <a href="${pageContext.request.contextPath}/shipmentOrderStatus" class="clickable-item">출하지시서 현황</a>
                    </div>
                </div>
            </div>
            <!-- 출하 -->
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#shipmentAccordion" aria-expanded="false" aria-controls="shipmentAccordion">
                       출하
                    </button>
                </h2>
                <div id="shipmentAccordion" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <a href="${pageContext.request.contextPath}/shipmentView" class="clickable-item">출하 조회</a>
                        <a href="${pageContext.request.contextPath}/shipmentInput" class="clickable-item">출하 입력</a>
                        <a href="${pageContext.request.contextPath}/shipmentStatus" class="clickable-item">출하 현황</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-content">
        <div class="container mt-5">
            <h2 class="mb-4 text-center"><b>견적서 입력</b></h2>
            <form action="quoteInput.do" method="post">
                <input type="hidden" name="action" value="insert" />
                
                <div class="mb-3 row">
                    <label for="quoteID" class="col-sm-2 col-form-label">견적서 ID</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="quoteID" name="quoteID" value="${quoteInput.quoteID}" />
                        <c:if test="${errors.quoteID}">
                            <span class="text-danger">필수 항목입니다.</span>
                        </c:if>
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label for="quoteNumber" class="col-sm-2 col-form-label">견적서 번호</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="quoteNumber" name="quoteNumber" value="${quoteInput.quoteNumber}" />
                        <c:if test="${errors.quoteNumber}">
                            <span class="text-danger">필수 항목입니다.</span>
                        </c:if>
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label for="customerCode" class="col-sm-2 col-form-label">거래처 코드</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="customerCode" name="customerCode" value="${quoteInput.customerCode}" />
                        <c:if test="${errors.customerCode}">
                            <span class="text-danger">필수 항목입니다.</span>
                        </c:if>
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label for="employeeCode" class="col-sm-2 col-form-label">담당자 코드</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="employeeCode" name="employeeCode" value="${quoteInput.employeeCode}" />
                        <c:if test="${errors.employeeCode}">
                            <span class="text-danger">필수 항목입니다.</span>
                        </c:if>
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label for="productCode" class="col-sm-2 col-form-label">품목 코드</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="productCode" name="productCode" value="${quoteInput.productCode}" />
                        <c:if test="${errors.productCode}">
                            <span class="text-danger">필수 항목입니다.</span>
                        </c:if>
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label for="validityPeriod" class="col-sm-2 col-form-label">유효 기간</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" id="validityPeriod" name="validityPeriod" value="${quoteInput.validityPeriod}" />
                        <c:if test="${errors.validityPeriod}">
                            <span class="text-danger">필수 항목입니다.</span>
                        </c:if>
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label for="totalAmount" class="col-sm-2 col-form-label">견적 금액 합계</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="totalAmount" name="totalAmount" value="${quoteInput.totalAmount}" />
                        <c:if test="${errors.totalAmount}">
                            <span class="text-danger">필수 항목입니다.</span>
                        </c:if>
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label for="status" class="col-sm-2 col-form-label">진행 상태</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="status" name="status" value="${quoteInput.status}" />
                        <c:if test="${errors.status}">
                            <span class="text-danger">필수 항목입니다.</span>
                        </c:if>
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label for="createdVoucher" class="col-sm-2 col-form-label">생성한 전표</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="createdVoucher" name="createdVoucher" value="${quoteInput.createdVoucher}" />
                        <c:if test="${errors.createdVoucher}">
                            <span class="text-danger">필수 항목입니다.</span>
                        </c:if>
                    </div>
                </div>
                
                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary px-5">제출</button>
                </div>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
