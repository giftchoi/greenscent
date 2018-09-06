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
		<div class="user-head">

			<div class="user-name">
				<h5>
					<a href="#">사용자 아이디</a>
				</h5>
				<span><a href="#">이메일@gmail.com</a></span>
			</div>
			<a class="mail-dropdown pull-right" href="javascript:;"> <i
				class="fa fa-chevron-down"></i>
			</a>
		</div>
		<div class="inbox-body">
			<a href="${pageContext.request.contextPath}/front?command=registerQnaForm"
				data-toggle="modal" title="Compose" class="btn btn-compose"> 새 글 작성 </a>
			<!-- Modal -->
			<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
				tabindex="-1" id="myModal" class="modal fade" style="display: none;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button aria-hidden="true" data-dismiss="modal" class="close"
								type="button">×</button>
							<h4 class="modal-title">Compose</h4>
						</div>
						<div class="modal-body">
							<form role="form" class="form-horizontal">
								<div class="form-group">
									<label class="col-lg-2 control-label">To</label>
									<div class="col-lg-10">
										<input type="text" placeholder="" id="inputEmail1"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Cc / Bcc</label>
									<div class="col-lg-10">
										<input type="text" placeholder="" id="cc" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Subject</label>
									<div class="col-lg-10">
										<input type="text" placeholder="" id="inputPassword1"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Message</label>
									<div class="col-lg-10">
										<textarea rows="10" cols="30" class="form-control" id=""
											name=""></textarea>
									</div>
								</div>

								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<span class="btn green fileinput-button"> <i
											class="fa fa-plus fa fa-white"></i> <span>Attachment</span> <input
											type="file" name="files[]" multiple="">
										</span>
										<button class="btn btn-send" type="submit">Send</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
		<ul class="inbox-nav inbox-divider">
			<li class="active"><a href="#"><i class="fa fa-inbox"></i>
					다이어리 게시판 <!-- <span class="label label-danger pull-right">2</span> --></a>

			</li>
			<li><a href="#"><i class="fa fa-envelope-o"></i> Tip 게시판</a></li>
			<li><a href="#"><i class="fa fa-bookmark-o"></i> Q&A 게시판</a></li>
			<li><a href="#"><i class=" fa fa-external-link"></i> 판매 게시판
					<!-- <span class="label label-info pull-right">30</span> --></a></li>
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
			<h3>다이어리 게시판</h3>
			<form action="#" class="pull-right position">
				<div class="input-append">
					<input type="text" class="sr-input" placeholder="제목을 입력하세요">
					<button class="btn sr-btn" type="button">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</form>
		</div>
		<div class="inbox-body">

			<div class="btn-group">
				<a data-original-title="Refresh" data-placement="top"
					data-toggle="dropdown" href="#" class="btn mini tooltips"> <i
					class=" fa fa-refresh"></i>
				</a>
			</div>
			<div class="btn-group hidden-phone">
				<a data-toggle="dropdown" href="#" class="btn mini blue"
					aria-expanded="false"> More <i class="fa fa-angle-down "></i>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li>
					<li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
					<li class="divider"></li>
					<li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
				</ul>
			</div>
			<div class="btn-group">
				<a data-toggle="dropdown" href="#" class="btn mini blue"> Move
					to <i class="fa fa-angle-down "></i>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li>
					<li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
					<li class="divider"></li>
					<li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
				</ul>
			</div>
		</div>
		<table class="table table-inbox table-hover">
			<tbody>
				<c:forEach items="${requestScope.qlvo.list}" var="qlvo">
					<tr class="">
						<td>${qlvo.qNo }</td>
						<td class="view-message">
									<c:choose> 
										<c:when test="${sessionScope.mvo!=null }">
											<a href="${pageContext.request.contextPath}/front?command=qnaDetail&qNo=${qlvo.qNo}">${qlvo.title}</a>
											
										</c:when>
										<c:otherwise>
											${qlvo.title}			
										</c:otherwise> 
									</c:choose> </td>
							<td class="view-message dont-show">${qlvo.mvo.id }</td>
							<td class="view-message inbox-small-cells"></td>
							<td class="view-message text-right">${qlvo.regDate }</td>
							
							
						</tr>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		
			<c:set var="pb" value="${requestScope.qlvo.pagingBean}"></c:set>
					<div class="container">
						<ul class="pagination">
							<c:if test="${pb.previousPageGroup}">
								<li><a
									href="front?command=qnaList&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
								end="${pb.endPageOfPageGroup}">
								<c:choose>
									<c:when test="${pb.nowPage!=i }">
										<li><a href="front?command=qnaList&pageNo=${i}">${i}</a>
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
								<a href="front?command=qnaList&pageNo=${pb.endPageofPageGroup+1}">
								&raquo;
								</a>
							</li>
							</c:if>	
						</ul>
					</div>
		
		
		
		<br>
		<br>
		<br>
		<br>
	</aside>
</div>

</div>


