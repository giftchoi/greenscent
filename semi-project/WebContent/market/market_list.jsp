<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	function marketSearch() {
		var search = document.searchForm.search.value;
		location.href = "${pageContext.request.contextPath}/front?command=marketPostSearch&search="
				+ search;

	}
</script>
<!------ Include the above in your HEAD tag ---------->
<html lang="en">
<head>
<!-- Required meta tags -->



</head>

<form name="searchForm">
	<%-- <input type="hidden" name="command" value=tipPostSearch>
				<input type="hidden" name="tNo" value="${requestScope.tvo.tNo}">  --%>
	<div class="input-append">
		<input type="text" name="search" class="sr-input"
			placeholder="제목을 입력하세요">
		<button class="btn sr-btn" type="button" onclick="marketSearch()">
			<i class="fa fa-search">검색</i>
		</button>
	</div>
</form>
<div class="container">

	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>No</th>
				<th>Name</th>
				<th>Title</th>
				<th>Availability</th>
				<th>Date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="pvo" items="${requestScope.mlist.list}">
				<tr>
					<td>${pvo.mno}</td>
					<td>${pvo.memberVO.name}</td>
					<td><c:choose>
							<c:when test="${sessionScope.mvo!=null}">
								<a
									href="${pageContext.request.contextPath}/front?command=marketPostDetail&mno=${pvo.mno}">
									${pvo.title}</a>
							</c:when>
							<c:otherwise>
								${pvo.title}
							</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${pvo.state==0}">
								<span class="label label-success">구매가능</span>
							</c:when>
							<c:otherwise>
								<span class="label label-important">판매완료</span>
							</c:otherwise>
						</c:choose></td>
					<td>${pvo.regDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<a
	href="${pageContext.request.contextPath}/front?command=marketWritePostForm"
	data-toggle="modal" title="Compose" class="btn btn-compose"
	align="right"> 새 글 작성 </a>

	
	
<c:set var="pb" value="${requestScope.pvo.pagingBean}"></c:set>

<c:set var="pb" value="${requestScope.mlist.pagingBean}"></c:set>

<div class="container">
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup}">
			<li><a
				href="front?command=marketList&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="front?command=marketList&pageNo=${i}" >${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="front?command=marketList&pageNo="
						${i}>${i}</a></li>
				</c:otherwise>
			</c:choose>
								&nbsp;
							</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a href="front?command=marketList&pageNo="${pb.endPageofPageGroup+1}">
					&raquo; </a></li>
		</c:if>
	</ul>
</div>
<!-- <div class="container">
	<ul class="pagination">
		<li class="disabled"><a href="#">«</a></li>
		<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">»</a></li>
	</ul>
</div> -->
<br>
<br>
<br>
<br>