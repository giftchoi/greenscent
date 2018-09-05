<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<br>
<br>
<br>
<br>
<br>
<br>



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

<br>
<br>
	<a href="${pageContext.request.contextPath}/front?command=marketList">리스트로
		돌아가기</a>



