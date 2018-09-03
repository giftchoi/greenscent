<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
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
 --%>


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
			<a href="${pageContext.request.contextPath}/testRegisterForm.jsp"
				data-toggle="modal" title="Compose" class="btn btn-compose"> 새 글
				작성 </a>
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

				<tr class="">
					<td class="inbox-small-cells"><input type="hidden"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
					<td class="view-message dont-show">JW Player</td>
					<td class="view-message"><a
						href="${pageContext.request.contextPath}/_detail.jsp">초록향에 올라온
							새글입니다. 글을 보려면 클릭하세요</a></td>
					<td class="view-message inbox-small-cells"></td>
					<td class="view-message text-right">March 15</td>
				</tr>
				<tr class="">
					<td class="inbox-small-cells"><input type="checkbox"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
					<td class="view-message dont-show">Tim Reid, S P N</td>
					<td class="view-message">Boost Your Website Traffic</td>
					<td class="view-message inbox-small-cells"></td>
					<td class="view-message text-right">April 01</td>
				</tr>
				<tr class="">
					<td class="inbox-small-cells"><input type="checkbox"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i class="fa fa-star "></i></td>
					<td class="view-message dont-show">Freelancer.com <span
						class="label label-danger pull-right">urgent</span></td>
					<td class="view-message">Stop wasting your visitors</td>
					<td class="view-message inbox-small-cells"></td>
					<td class="view-message text-right">May 23</td>
				</tr>
				<tr class="">
					<td class="inbox-small-cells"><input type="checkbox"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i
						class="fa fa-star inbox-started"></i></td>
					<td class="view-message dont-show">WOW Slider</td>
					<td class="view-message">New WOW Slider v7.8 - 67% off</td>
					<td class="view-message inbox-small-cells"><i
						class="fa fa-paperclip"></i></td>
					<td class="view-message text-right">March 14</td>
				</tr>
				<tr class="">
					<td class="inbox-small-cells"><input type="checkbox"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i
						class="fa fa-star inbox-started"></i></td>
					<td class="view-message dont-show">LinkedIn Pulse</td>
					<td class="view-message">The One Sign Your Co-Worker Will Stab</td>
					<td class="view-message inbox-small-cells"><i
						class="fa fa-paperclip"></i></td>
					<td class="view-message text-right">Feb 19</td>
				</tr>
				<tr class="">
					<td class="inbox-small-cells"><input type="checkbox"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
					<td class="view-message dont-show">Drupal Community<span
						class="label label-success pull-right">megazine</span></td>
					<td class="view-message view-message">Welcome to the Drupal
						Community</td>
					<td class="view-message inbox-small-cells"></td>
					<td class="view-message text-right">March 04</td>
				</tr>
				<tr class="">
					<td class="inbox-small-cells"><input type="checkbox"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
					<td class="view-message dont-show">Facebook</td>
					<td class="view-message view-message">Somebody requested a new
						password</td>
					<td class="view-message inbox-small-cells"></td>
					<td class="view-message text-right">June 13</td>
				</tr>
				<tr class="">
					<td class="inbox-small-cells"><input type="checkbox"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
					<td class="view-message dont-show">Skype <span
						class="label label-info pull-right">family</span></td>
					<td class="view-message view-message">Password successfully
						changed</td>
					<td class="view-message inbox-small-cells"></td>
					<td class="view-message text-right">March 24</td>
				</tr>
				<tr class="">
					<td class="inbox-small-cells"><input type="checkbox"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i
						class="fa fa-star inbox-started"></i></td>
					<td class="view-message dont-show">Google+</td>
					<td class="view-message">alireza, do you know</td>
					<td class="view-message inbox-small-cells"></td>
					<td class="view-message text-right">March 09</td>
				</tr>
				<tr class="">
					<td class="inbox-small-cells"><input type="checkbox"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i
						class="fa fa-star inbox-started"></i></td>
					<td class="dont-show">Zoosk</td>
					<td class="view-message">7 new singles we think you'll like</td>
					<td class="view-message inbox-small-cells"><i
						class="fa fa-paperclip"></i></td>
					<td class="view-message text-right">May 14</td>
				</tr>
				<tr class="">
					<td class="inbox-small-cells"><input type="checkbox"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
					<td class="view-message dont-show">LinkedIn</td>
					<td class="view-message">Alireza: Nokia Networks, System Group
						and</td>
					<td class="view-message inbox-small-cells"><i
						class="fa fa-paperclip"></i></td>
					<td class="view-message text-right">February 25</td>
				</tr>
				<tr class="">
					<td class="inbox-small-cells"><input type="checkbox"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
					<td class="dont-show">Facebook</td>
					<td class="view-message view-message">Your account was
						recently logged into</td>
					<td class="view-message inbox-small-cells"></td>
					<td class="view-message text-right">March 14</td>
				</tr>
				<tr class="">
					<td class="inbox-small-cells"><input type="checkbox"
						class="mail-checkbox"></td>
					<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
					<td class="view-message dont-show">Twitter</td>
					<td class="view-message">Your Twitter password has been
						changed</td>
					<td class="view-message inbox-small-cells"></td>
					<td class="view-message text-right">April 07</td>
				</tr>
			</tbody>
		</table>
		<br>
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
	</aside>
</div>


