<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- <meta content="width=device-width, initial-scale=1" name="viewport">

<link
	href="https://daks2k3a4ib2z.cloudfront.net/56d3f1b99aaa616f508a6253/css/lamar-template.webflow.302b71073.css"
	rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

 -->
<!-- <div class="content-wrapper"> -->
<!-- <div class="w-container"> -->
<!-- <div class="blog-body-wrapper">
 -->
<%-- <div class="post-title-section">
	<h1>${mvo.title}</h1>
	<div class="post-info-wrapper">
		<div class="post-info">${mvo.regDate}</div>

	</div>
</div> --%>
<%-- <div class="body-copy w-richtext">
	<p>
	<pre>${mvo.content}</pre>
	</p>
 --%>
<br>
<br>
<br>
<br>
<br>
<br>
<head>
<!-- Required meta tags -->
<style> 
BODY, TABLE, TD {font-size:20px} 
</style> 

</head>

<table border="2" align="center">
	<tr>
		<td>글 번호 : ${requestScope.mvo.mno}</td>
		<td>글 제목 : ${requestScope.mvo.title}</td>
		<td>작성자 : ${requestScope.mvo.memberVO.name}</td>
		<td>현재상황 : <c:choose>
				<c:when test="${requestScope.mvo.state==0}">
					<span class="label label-success">판매가능</span>
				</c:when>
				<c:otherwise>
					<span class="label label-important">판매완료</span>
				</c:otherwise>
			</c:choose> </td>
		<td>등록일시 : ${requestScope.mvo.regDate}</td>
	</tr>
	<tr>
		<td colspan="5"><pre>${requestScope.mvo.content}</pre></td>
	</tr>
	<%-- <tr>
		<td>
			<c:if test="${requestScope.mvo.memberVO.id==sessionScope.mvo.id}">
				<form action="${pageContext.request.contextPath}/front" name="MarketDeleteForm" method="post">
				<input type="hidden" name="command" value="marketDeletePost">	
				<input type="hidden" name="mno" value="${requestScope.mvo.mno}">
				</form>
				<button type="button" onclick="deleteMarket()">삭제</button>
				<button type="button" onclick="updateMarket()">수정</button>
			</c:if>
		</td>
	</tr> --%>
</table>
<br>
<br>
<%--수정 삭제 --%>
<script type="text/javascript">
	function sendList() {
		location.href = "${pageContext.request.contextPath}/market/market_list.jsp";
	}
	function deleteMarket() {
		if (confirm("게시글을 삭제하시겠습니까?")) {
			document.deleteForm.submit();
		}
	}
	function updateMarket() {
		if (confirm("게시글을 수정하시겠습니까?")) {
			document.updateForm.submit();
		}
	}
</script>
<%-- <c:if test="${requestScope.dvo.vo.id==sessionScope.mvo.id}"> --%>
<form name="updateForm"
	action="${pageContext.request.contextPath}/front" method="post">
	<input type="hidden" name="command" value="marketUpdatePostForm">
	<input type="hidden" name="mno" value="${requestScope.mvo.mno}">
	<button type="button" class="btn" onclick="updateMarket()">수정</button>
</form>
<br>
<br>
<form name="deleteForm"
	action="${pageContext.request.contextPath}/front" method="post">
	<input type="hidden" name="command" value="marketDeletePost"> <input
		type="hidden" name="mno" value="${requestScope.mvo.mno}">
	<button type="button" class="btn" onclick="deleteMarket()">삭제</button>
</form>

<%-- 		<form name="returnForm"
			action="${pageContext.request.contextPath}/front">
			<input type="hidden" name="command" value="marketList">
			<!-- 			<input type="hidden" name="command" value="marketList&pageNo=1">
			 -->
			<input type="hidden" name="pageNo" value="1">
			<button type="button" class="btn" onclick="sendList()">리스트</button>
		</form> --%>
<br>
<br>
<div class="project-hover">
	<a href="${pageContext.request.contextPath}/front?command=marketList">리스트로
		돌아가기</a>
</div>

<%--  </c:if> --%>


<!-- 댓글jsp import	 -->
<%-- 	<c:import url="/reply.jsp" /> --%>

<!-- </div> -->
<!-- </div>
 -->
<%-- <div class="button-wrapper">
	<c:choose>
		<c:when test="${requestScope.postName eq 'mydiary'}">
			<a class="button w-button"
				href="${pageContext.request.contextPath}/front?command=diaryList">←&nbsp;글
				목록으로 이동</a>
		</c:when>
		<c:when test="${requestScope.postName eq 'sharediary'}">
			<a class="button w-button"
				href="${pageContext.request.contextPath}/front?command=publicDiaryList">←&nbsp;글
				목록으로 이동</a>
		</c:when>
	</c:choose>
	<br>
	<br>
</div> --%>




