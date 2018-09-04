<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<meta content="width=device-width, initial-scale=1" name="viewport">

<link
	href="https://daks2k3a4ib2z.cloudfront.net/56d3f1b99aaa616f508a6253/css/lamar-template.webflow.302b71073.css"
	rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- <div class="content-wrapper"> -->
<!-- <div class="w-container"> -->
<div class="blog-body-wrapper">
	<div class="post-title-section">
		<h1>${mvo.title}</h1>
		<div class="post-info-wrapper">
			<div class="post-info">${mvo.regDate}</div>
			<div class="post-info">|</div>
			<a class="post-info when-link" href="/categories/music">카데고리
				자리입니다</a>
		</div>
	</div>
	<div class="body-copy w-richtext">
		<p>
		<pre>${mvo.content}</pre>
		</p>


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
		<form name="deleteForm"
			action="${pageContext.request.contextPath}/front" method="post">
			<input type="hidden" name="command" value="marketDeletePost">
			<input type="hidden" name="mno" value="${requestScope.mvo.mno}">
			<button type="button" class="btn" onclick="deleteMarket()">삭제</button>
		</form>
		<form name="updateForm"
			action="${pageContext.request.contextPath}/front" method="post">
			<input type="hidden" name="command" value="marketUpdatePostForm">
			<input type="hidden" name="mno" value="${requestScope.mvo.mno}">
			<button type="button" class="btn" onclick="updateMarket()">수정</button>
		</form>
<%-- 		<form name="returnForm"
			action="${pageContext.request.contextPath}/front">
			<input type="hidden" name="command" value="marketList">
			<!-- 			<input type="hidden" name="command" value="marketList&pageNo=1">
			 -->
			<input type="hidden" name="pageNo" value="1">
			<button type="button" class="btn" onclick="sendList()">리스트</button>
		</form> --%>
		
		<div class="project-hover">
            <a href="${pageContext.request.contextPath}/front?command=marketList">리스트로 돌아가기</a>
        </div>
        
		<%--  </c:if> --%>


		<!-- 댓글jsp import	 -->
		<%-- 	<c:import url="/reply.jsp" /> --%>

	</div>
</div>
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




