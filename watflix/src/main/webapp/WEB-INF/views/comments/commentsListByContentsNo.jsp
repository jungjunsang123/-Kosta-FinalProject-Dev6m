<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="container-lg">
	<script type="text/javascript">
		$(document).ready(function(){
			$("#openCommentsWriteFormButton").click(function(){
				alert('1');
				var popupWidth = 500; // 팝업창 가로크기
				var popupHeight = 600; // 팝업창 세로크기
				
				// window.screen.width로 현재 윈도우창의 가로크기를 가져온다.
				// widdow.screen.height로 현재 윈도우창의 세로크기를 가져온다.
				//아래 공식을 적용하여 팝업창을 현재 화면의 중간에 띄운다.
				var popupX = (window.screen.width / 2) - (popupWidth / 2);
				var popupY = (window.screen.height / 2) - (popupHeight / 2);
								
				window.open("${pageContext.request.contextPath}/commentsWriteForm.do?contentsNo=${requestScope.contentsNo}", "평점입력",
						"width="+popupWidth+",height="+popupHeight+",left="+popupX+",top="+popupY);
			})
			$("form[name='commentsDeleteForm']").submit(function(){
				alert(document.getElementByName("commentsDelete"));
				
				return confirm("삭제하시겠습니까?");
			})
		})
	</script>
	<h4>평점</h4>
	<sec:authorize access="hasRole('ROLE_MEMBER')" >
	<button type="button" id="openCommentsWriteFormButton">평점쓰기</button>
	</sec:authorize> 
	<sec:authentication property="principal.id" var="userId"/>
	<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin"/>
	<table class="table table-borderde table-hober boardlist">
		<c:forEach items="${requestScope.commentsListByContentsNo.list}" var="commentsListByContentsNo">
		<tr>
			<td>
				별점 : ${commentsListByContentsNo.commentsStars}
			</td>
			<td>
				별점 점수 : ${commentsListByContentsNo.commentsStars}
			</td>
			<td>
				comments : ${commentsListByContentsNo.comments}
			</td>
		</tr>
		<tr>
			<td>
				아이디 : ${commentsListByContentsNo.memberVO.id }
			</td>
			<td>
				작성 일시 : ${commentsListByContentsNo.commentsPostedTime}
			</td>
			<td>
				<a href="#">신고링크</a>
			</td>
			<c:set var="writerId" value="${commentsListByContentsNo.memberVO.id }"/>
			<c:if test="${writerId == userId || isAdmin == 'true'}">
			<td>
				<form action="${pageContext.request.contextPath}/commentsDelete.do" method="post" name="commentsDeleteForm">
					<sec:csrfInput/>
					<input type="hidden" name="commentsDelete" value="${commentsList.commentsNo}">
					<input type="submit" value="삭제">
				</form>
			</td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
	<div class="pagingInfo">
		<c:set var="pagingBean" value="${requestScope.commentsListByContentsNo.pagingBean}"/>
		<ul class="pagination">
			<c:if test="${pagingBean.previousPageGroup}">
				<li><a href="${pageContext.request.contextPath}/getCommentsListByContentsNo.do?pageNo=${pagingBean.startPageOfPageGroup-1}">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pagingBean.nowPage!=i}">
						<li><a href="${pageContext.request.contextPath}/getCommentsListByContentsNo.do?pageNo=${i}">${i}</a></li>
					</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
				</c:choose>
				&nbsp;
			</c:forEach>
			<c:if test="${pagingBean.nextPageGroup}">
				<li><a href="${pageContext.request.contextPath}/getCommentsListByContentsNo.do?pageNo=${pagingBean.endPageOfPageGroup+1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</div>