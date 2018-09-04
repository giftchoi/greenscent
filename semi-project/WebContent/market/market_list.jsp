<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


</head>

<div class="container">
<a href="${pageContext.request.contextPath}/front?command=marketWritePostForm"
					data-toggle="modal" title="Compose" class="btn btn-compose"> 새
					글 작성 </a>
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
			<c:forEach var="pvo" items="${requestScope.mlist}">
				<tr>
					<td>${pvo.mno}</td>
					<td>
						${pvo.memberVO.name}
					</td>
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
					<td>
					<c:choose>
							<c:when test="${pvo.state==0}">
								<span class="label label-success">판매가능</span>
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
<div class="container">
	<ul class="pagination">
		<li class="disabled"><a href="#">«</a></li>
		<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">»</a></li>
	</ul>
</div>
<br>
<br>
<br>
<br>