<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<title>공지사항 글 목록</title>
	
</head>
<body>
	<table>
		<tbody>
		<c:forEach var="board" items="${boardList}">
		  <c:url var="detail" value="/board/detail">
		  	<c:param name="bNo" value="${board.bNo}"/>
		  	<c:param name="currentPage" value="${paging.currentPage}"/>
		  </c:url>
		  <tr class="bg-blue">
		        <td>${board.bNo}</td>
		        <td>${board.bSubject}</td>
		        <td>${board.bWritter}</td>
		        <td><fmt:formatDate value="${board.bRegDate}" pattern="yy-MM-dd"/></td>
		        <td>${board.bCount}</td>
		    </tr>
		</c:forEach>
		</tbody>
	</table>
	   <!-- 페이징 처리 -->
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
        
            <!-- 이전 -->
            <c:if test="${paging.currentPage eq 1}">
                <li class="page-item">
                      <a class="page-link no-before" tabindex="-1" aria-disabled="true">이전</a>
                  </li>
            </c:if>
            <c:if test="${paging.currentPage ne 1}">
                <c:url var="before" value="/board/list">
                    <c:param name="currentPage" value="${paging.currentPage - 1}"/>
                </c:url>
                
                <li class="page-item">
                      <a class="page-link" tabindex="-1" href="${before}" aria-disabled="true">이전</a>
                  </li>
            </c:if>
            
            <!-- 페이지 -->
            <c:forEach var="page" begin="${paging.startPage}" end="${paging.endPage}">
                <c:if test="${page eq paging.currentPage }">
                    <li class="page-item"><a class="page-link bg-primary text-light">${page}</a></li>
                </c:if>
                
                <c:if test="${page ne paging.currentPage }">
                    <c:url var="pagination" value="/board/list">
                        <c:param name="currentPage" value="${paging.currentPage + 1}"/>
                    </c:url>
                    
                    <li class="page-item"><a tabindex="-1" aria-disabled="true" class="page-link" href="${after}">다음</a></li>
                </c:if>
            </c:forEach>
            
            <!-- 다음 -->
             <c:if test="${paging.currentPage eq paging.maxPage}">
                <li class="page-item">
                      <a class="page-link no-before" tabindex="-1" aria-disabled="true">다음</a>
                  </li>
            </c:if>
            <c:if test="${paging.currentPage ne paging.maxPage}">
                <c:url var="after" value="/tutorial/board">
                    <c:param name="currentPage" value="${paging.currentPage + 1}"/>
                </c:url>
                
                <li class="page-item">
                      <a class="page-link" tabindex="-1" href="${after}" aria-disabled="true">다음</a>
                  </li>
            </c:if>
            
        </ul>
    </nav>
	
</body>
</html>