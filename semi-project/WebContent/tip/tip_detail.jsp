<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function tipDelete(){
		if(confirm("게시글을 삭제 하시겠습니까?"))
			document.tipDeleteForm.submit();
	}
	function tipUpdate(){
		if(confirm("게시글을 수정 하시겠습니까?"))
			location.href="${pageContext.request.contextPath}/front?command=tipUpdateForm&tNo=${requestScope.tvo.tNo}";
	}
</script>

<body>

<table>
	<tr>
		<td>글 번호 : ${requestScope.tvo.tNo}</td>
		<td>글 제목 : ${requestScope.tvo.title}</td>
		<td>작성자 : ${requestScope.tvo.memberVO.name}</td>
		<td>조회수 : ${requestScope.tvo.hits}</td>
		<td>등록일시 : ${requestScope.tvo.regDate}</td>
	</tr>
	<tr>
	<td>
		<pre>${requestScope.tvo.content}</pre>
	</td>
	</tr>
	<tr>
		<td>
			<c:if test="${requestScope.tvo.memberVO.id==sessionScope.mvo.id}">
				<form action="${pageContext.request.contextPath}/front" name="tipDeleteForm" method="post">
				<input type="hidden" name="command" value="tipDelete">	
				<input type="hidden" name="tNo" value="${requestScope.tvo.tNo}">
				</form>
				<button type="button" onclick="tipDelete()">삭제</button>
				<button type="button" onclick="tipUpdate()">수정</button>
			</c:if>
		</td>
	</tr>
</table>

</body>
</html>