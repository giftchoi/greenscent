<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel='stylesheet prefetch'
		href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/post_list.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/paging.css">
<div class="container">
	
	<div class="mail-box">
		<aside class="sm-side">
			<div class="mail-box">
				<aside class="sm-side">
					<div class="user-head">
						<div class="user-name">
							<h5>
								<a href="#">사용자 아이디</a>
							</h5>
							<span><a href="#">이메일@gmail.com</a></span>
						</div>

					</div>
					<div class="inbox-body">
						<a
							href="${pageContext.request.contextPath}/front?command=tipRegisterForm"
							data-toggle="modal" title="Compose" class="btn btn-compose">
							새 글 작성 </a>
						<!-- Modal -->

						<ul class="inbox-nav inbox-divider">
							<li class="active"><a href="#"><i class="fa fa-inbox"></i>
									다이어리 게시판 <!-- <span class="label label-danger pull-right">2</span> --></a>

							</li>
							<li><a href="#"><i class="fa fa-envelope-o"></i> Tip 게시판</a></li>
							<li><a href="#"><i class="fa fa-bookmark-o"></i> Q&A 게시판</a></li>
							<li><a href="#"><i class=" fa fa-external-link"></i> 판매
									게시판 <!-- <span class="label label-info pull-right">30</span> --></a></li>
							<li><a href="#"><i class=" fa fa-external-link"></i> 홈 <!-- <span class="label label-info pull-right">30</span> --></a>
							</li>

						</ul>
						<div class="inbox-body text-center">
							<div class="btn-group">
								<a class="btn mini btn-primary" href="javascript:;"> <i
									class="fa fa-plus"></i>
								</a>
							</div>
							<div class="btn-group">
								<a class="btn mini btn-success" href="javascript:;"> <i
									class="fa fa-phone"></i>
								</a>
							</div>
							<div class="btn-group">
								<a class="btn mini btn-info" href="javascript:;"> <i
									class="fa fa-cog"></i>
								</a>
							</div>
						</div>
				</aside>
				<aside class="lg-side">
					<div class="inbox-head ">
						<h3>Tip 게시판</h3>
						<script type="text/javascript">
							function tipSearch() {
									var search = document.searchForm.search.value;
									location.href = "${pageContext.request.contextPath}/front?command=tipPostSearch&search="
										+ search;

							}
							$()
						</script>
						<form name="searchForm" class="pull-right position">
							<div class="input-append">
								<input type="text" name="search" class="sr-input"
									placeholder="제목을 입력하세요" onkeypress="if(event.keyCode==13) {tipSearch(); return false;}">
								<button class="btn sr-btn" type="button" onclick="tipSearch()"
								>
									<i class="fa fa-search"></i>
								</button>
							</div>
						</form>
					</div>

					<table class="table table-inbox table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>등록일시</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.tlvo.list}" var="tlvo">
								<tr>
									<td>${tlvo.tNo}</td>
									<td>
										<%-- <c:choose> --%> <%-- <c:when test="${sessionScope.mvo!=null }"> --%>
										<a
										href="${pageContext.request.contextPath}/front?command=tipDetail&tNo=${tlvo.tNo}">
											${tlvo.title} </a> <%-- </c:when> --%> <%-- <c:otherwise> --%> <%-- ${tlvo.title}	 --%>
										<%-- 	</c:otherwise> --%> <%-- </c:choose> --%>
									</td>
									<td>${tlvo.memberVO.name }</td>
									<td>${tlvo.regDate }</td>
									<td>${tlvo.hits }</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<br>
					<c:set var="pb" value="${requestScope.tlvo.pagingBean}"></c:set>
					<div class="container">
						<ul class="pagination">
							<c:if test="${pb.previousPageGroup}">
								<li><a
									href="front?command=tipList&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
								end="${pb.endPageOfPageGroup}">
								<c:choose>
									<c:when test="${pb.nowPage!=i }">
										<li><a href="front?command=tipList&pageNo=" ${i}>${i}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="active"><a href="#">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
								&nbsp;
							</c:forEach>
							<c:if test="${pb.nextPageGroup}">
							<li>
								<a href="front?command=tipList&pageNo="${pb.endPageofPageGroup+1}">
								&raquo;
								</a>
							</li>
							</c:if>	
						</ul>
					</div>
					<br> <br> <br> <br>
			</div>
		</aside>
	</div>
</div>