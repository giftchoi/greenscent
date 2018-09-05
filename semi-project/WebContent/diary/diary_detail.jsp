<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <meta charset="utf-8"> -->


<!-- header 선언부 -->


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
		<h1>${dvo.title}</h1>
		<div class="post-info-wrapper">
			<div class="post-info">${dvo.regDate}|${dvo.vo.name}</div>
		</div>
	</div>
	<div class="body-copy w-richtext">
		<p>
		<pre>${dvo.content}</pre>
		</p>


		<%--수정 삭제 --%>
		<script type="text/javascript">
			function sendList() {
				location.href = "${pageContext.request.contextPath}/index.jsp";
			}
			function deleteDiary() {
				if (confirm("게시글을 삭제하시겠습니까?")) {
					document.deleteForm.submit();
				}
			}
			function updateDiary() {
				if (confirm("게시글을 수정하시겠습니까?")) {
					document.updateForm.submit();
				}
			}
		</script>
		<c:if test="${requestScope.dvo.vo.id==sessionScope.mvo.id}">
		<form name="deleteForm"
			action="${pageContext.request.contextPath}/front" method="post">
			<input type="hidden" name="command" value="deleteDiary"> 
			<input type="hidden" name="dno" value="${requestScope.dvo.dno}">
		<button type="button" class="btn" onclick="deleteDiary()">삭제</button></form>
		<form name="updateForm"	action="${pageContext.request.contextPath}/front" method="post">
			<input type="hidden" name="command" value="updateDiaryForm"> 
			<input type="hidden" name="dno" value="${requestScope.dvo.dno}">
		<button type="button" class="btn" onclick="updateDiary()">수정</button></form>
		</c:if>


<!----------------------------------------- 댓글 form -------------------------------------------------->
  <form action="${pageContext.request.contextPath }/front" method="post">
	<input type="hidden" name="command" value="writeReplyInDiary">
	<input type="hidden" name="dno" value="${requestScope.dvo.dno}">
	<input type="hidden" name="id" value="${sessionScope.mvo.id}">

	<div class="form-group">
      <label for="comment">댓글달기:</label>
      <textarea class="form-control" rows="1" id="replycontent" name="replycontent"></textarea>
    </div>
    <button type="submit" class="btn btn-success">등록</button>
  </form>
  
  <c:if test="${fn:length(requestScope.rvoList)!=0}">
  <br><br><br>
  <p align="left"> ${fn:length(requestScope.rvoList)}개의 댓글</p>
  <br>
  <c:forEach items="${requestScope.rvoList}" var="comment">
  <p align="left">${comment.id }</p>
  	<c:if test="${comment.id == sessionScope.mvo.id}">
  		<form action="${pageContext.request.contextPath }/front" method="post" id="deletecommentform">
		<input type="hidden" name="command" value="deleteReplyInDiary">
		<input type="hidden" name="rno" value="${comment.rNo}">
		<input type="hidden" name="dno" value="${requestScope.dvo.dno}">
		<input style="float: right;" class="btn btn-danger" type="button" value="삭제" onclick="deleteComment()">
		</form>
  	</c:if>
  	
  <div class="card">
    <div class="card-body" align="left"><pre>${comment.content }</pre></div>
  </div>
  </c:forEach>
  </c:if>
	<br>
	
	<script type="text/javascript">
function deleteComment() {
	if(confirm("댓글을 삭제하시겠습니까?"))
		$("#deletecommentform").submit();
}
</script>
<!------------- 댓글 form --------------------------------->

	</div>
</div>
<div class="button-wrapper">
	<c:choose>
		<c:when test="${requestScope.postName eq 'diaryList'}">
			<a class="button w-button"
				href="${pageContext.request.contextPath}/front?command=${postName}">←&nbsp;글
				목록으로 이동</a>
		</c:when>
		<c:when test="${requestScope.postName eq 'publicDiaryList'}">
			<a class="button w-button"
				href="${pageContext.request.contextPath}/front?command=publicDiaryList">←&nbsp;글
				목록으로 이동</a>
		</c:when>
	</c:choose>
	<br>
	<br>
</div>




