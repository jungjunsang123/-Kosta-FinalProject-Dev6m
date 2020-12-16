<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
	// 웹페이지 로딩 후 바로 실행 됨
	$(document).ready(function() {
		//getReportList("1", true);
	});
	function getReportList(reportPageNo, reportType){
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/reportBoardAdmin.do",
			dataType: "json",
			data: 'reportPageNo='+reportPageNo+'&reportType='+reportType,
			success:function(reportData){	
				listByReportType(reportData);	
				reportPostPaging(reportData, reportType);
			}
		});
	}
	function listByReportType(reportListVO){
		var reportTbody = "";
		for (var i=0; i < reportListVO.list.length; i++){
			reportTbody += "<tr>";
				reportTbody += "<td>"+reportListVO.list[i].reportNo+"</td>";
				reportTbody += "<td>"+reportListVO.list[i].memberVO.id+"</td>";
				reportTbody += "<td>"+reportListVO.list[i].reportTypeVO.reportTypeInfo+"</td>";
				// comments, review 글을 분리한다.
				if(reportListVO.list[i].reviewVO != null){
					reportTbody += "<td>"+reportListVO.list[i].reviewVO.reviewNo+"</td>";
					reportTbody += "<td>"+reportListVO.list[i].reviewVO.memberVO.id+"</td>";
				} else {
					reportTbody += "<td>"+reportListVO.list[i].commentsVO.commentsNo+"</td>";
					reportTbody += "<td>"+reportListVO.list[i].commentsVO.memberVO.id+"</td>";
				}
				reportTbody += "<td>"+reportListVO.list[i].reportPostedTime+"</td>";
				reportTbody += "<td>"
					<!-- 신고글 삭제 -->
					reportTbody += "<form action='deleteReport.do' method='post' onsubmit='return deleteCheck()'>"
					<!-- CSRF 방지 토큰,  Cross-site request forgery(사이트간 요청 위조)를 방지  -->
						reportTbody += '<sec:csrfInput/>';
						reportTbody += "<input type='hidden' name='reportNo' value='"+reportListVO.list[i].reportNo+"'>";			
						reportTbody += "<input type='hidden' name='commentsNo' value='"+reportListVO.list[i].commentsVO.commentsNo+"'>";
						reportTbody += "<input type='submit' value='deleteReport'>";
					reportTbody += "</form>"
				reportTbody += "</td>"
			reportTbody += "</tr>";
			reportTbody += "<tr>";
			reportTbody += "<td colspan='6'><pre>"+reportListVO.list[i].reportContents+"</pre></td>";
			<!-- 신고된 평점 삭제 -->
			<!-- CommentsController 참고 후 수정 -->
			reportTbody += "<td>";
			reportTbody += "<form action='' method='post'>";
			<!-- CSRF 방지 토큰,  Cross-site request forgery(사이트간 요청 위조)를 방지  -->
			reportTbody += '<sec:csrfInput/>';
				reportTbody += "<input type='hidden' name='' value='${rvo.commentsVO.commentsNo}'>";
				reportTbody += "<input type='submit' value='deleteComments'>";
			reportTbody += "</form>";
			reportTbody += "</td>";
			reportTbody += "</tr>";
		}
		$("#reportTbody").html(reportTbody);
	}
	
	function reportPostPaging(reportListVO, reportType) {
		// table의 tfoot( 페이징 )
		var reportPaging = "";
		var startPageGroup = reportListVO.pagingBean.startPageOfPageGroup;
		var endPageGroup = reportListVO.pagingBean.endPageOfPageGroup;
		// 왼쪽 페이징 화살표
		if (reportListVO.pagingBean.previousPageGroup){
			reportPaging += "<li><a href='#' onclick='getReportList("+ (startPageGroup -1) +","+ reportType +"); return false;'>&laquo;</a></li>";
		}
		// 페이징 번호
		for (var reportPageNo = startPageGroup; reportPageNo <= endPageGroup; reportPageNo++){
			if(reportListVO.pagingBean.nowPage != reportPageNo){
				reportPaging += "<li><a href='#' onclick='getReportList("+ reportPageNo +","+ reportType +"); return false;'>"+ reportPageNo + "</a></li>";
			}else{
				reportPaging += "<li><a href='#' onclick='return false'>"+ reportPageNo + "</a></li>";				
			}
		}
		// 오른쪽 화살표 페이징
		if(reportListVO.pagingBean.nextPageGroup){
			reportPaging += "<li><a href='#' onclick='getReportList("+ (endPageGroup + 1) +","+ reportType +"); return false;'>&raquo;</a></li>";
		}
		$("#reportPaging").html(reportPaging);
	}
</script>
<div class="tableMargin" id="commentsList">
	<div class="container-lg boardClassMain" style="margin-top: 100px">
		<h4 style="display: inline-flex;">전체신고글</h4>
		<a href="#" onclick="getReportList('1', true); return false;">평점</a>
		<a href="#" onclick="getReportList('1', false); return false;">리뷰</a>
		<table class="table table-hover" id="myReportList" >
		<thead>
			<tr>
				<th>No</th>
				<th>신고자ID</th>
				<th>신고 유형</th>
				<th>신고된 평점No</th>
				<th>평점 작성자ID</th>
				<th>신고 날짜</th>
				<th>비고</th>
			</tr>
		</thead>
		<!-- 신고 리스트(평점) -->
		<tbody id="reportTbody">
			<c:forEach var="rvo" items="${requestScope.reportCommentsList.list}">
				<tr>
					<td>${rvo.reportNo}</td>
					<td>${rvo.memberVO.id}</td>
					<td>${rvo.reportTypeVO.reportTypeInfo}</td>
					<td>${rvo.commentsVO.commentsNo}</td>
					<td>${rvo.commentsVO.memberVO.id}</td>
					<td>${rvo.reportPostedTime}</td>
					<td>
						<!-- 신고글 삭제 -->
						<form action="deleteReport.do" method="post" onsubmit="return deleteCheck()">
							<!-- CSRF 방지 토큰,  Cross-site request forgery(사이트간 요청 위조)를 방지  -->
							<sec:csrfInput/>
							<input type="hidden" name="reportNo" value="${rvo.reportNo}">
							<input type="hidden" name="commentsNo" value="${rvo.commentsVO.commentsNo}">
							<input type="submit" value="deleteReport">
						</form>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<pre>${rvo.reportContents}</pre>
					</td>
					<td>
						<!-- 신고된 평점 삭제 -->
						<!-- CommentsController 참고 후 수정 -->
						<form action="" method="post">
							<!-- CSRF 방지 토큰,  Cross-site request forgery(사이트간 요청 위조)를 방지  -->
							<sec:csrfInput/>
							<input type="hidden" name="" value="${rvo.commentsVO.commentsNo}">
							<input type="submit" value="deleteComments">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="boardBottomDiv" style="width: 50%">
		<!-- 페이징 -->
		<div class="pagingInfo" id="pagingLocation">
			<!-- pagingBean을 pb변수로 지정 -->
			<c:set var="pb" value="${requestScope.reportCommentsList.pagingBean }"></c:set>
				<ul class="pagination">
					<!-- 조건이 맞으면 왼쪽 화살표 -->
					<c:if test="${pb.previousPageGroup}">
						<li><a href="#" onclick="getReportList(${pb.startPageOfPageGroup-1}, 1); return false">&laquo;</a></li>
					</c:if>
					<!-- 페이지 넘버 표시 -->
					<c:forEach var="i"	begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=pageNumber}">
								<li><a href="#" onclick="getReportList(${i}, 1); return false;">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a href="#" onclick="return false">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
						<!-- 조건에 맞으면 오른쪽 화살표 -->
						<c:if test="${pb.nextPageGroup}">
							<li><a href="#" onclick="getReportList(${pagingBean.endPageOfPageGroup+1}, 1); return false">&raquo;</a></li>
						</c:if>
						</ul>
					</div>
				</div>
</div>	
</div>


























