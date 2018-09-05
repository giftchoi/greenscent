<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

function loginForm() {
	location.href="${pageContext.request.contextPath}/front?command=loginForm";
}
function registerMemberForm() {
	location.href="${pageContext.request.contextPath}/front?command=registerMemberForm";
}

function logout() {
	location.href="${pageContext.request.contextPath}/front?command=logout";
}
function updateMemberForm() {
	location.href="${pageContext.request.contextPath}/front?command=updateMemberForm";
}
function sitemap() {
	document.documentElement.scrollTop = document.body.scrollHeight;
}

function diaryList() {
	location.href="${pageContext.request.contextPath}/front?command=diaryList";
}
function tipList() {
	location.href="${pageContext.request.contextPath}/front?command=tipList";
}
function qnaList() {
	location.href="${pageContext.request.contextPath}/front?command=qnaList";
}
function marketList() {
	location.href="${pageContext.request.contextPath}/front?command=marketList";
}
</script>


<div class="container">
	<div class="row">
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<div class="col-sm-2" align="left">
					<a href="index.jsp"><img
						src="${pageContext.request.contextPath }/image/greenscent_logo.gif"
						width="200" height="100"></a>
				</div>
				<div class="col-sm-7">
					<div class="btn-group btn-group-justified">
						<div class="btn-group">
							<button type="button" class="btn btn-nav" onclick="">
								<span class="glyphicon glyphicon-briefcase"></span>
								<p>Private Diary</p>
							</button>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-nav" onclick="diaryList()">
								<span class="glyphicon glyphicon-calendar"></span>
								<p>Diary</p>
							</button>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-nav" onclick="tipList()">
								<span class="glyphicon glyphicon-book"></span>
								<p>Tip</p>
							</button>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-nav" onclick="qnaList()">
								<span class="glyphicon glyphicon-leaf"></span>
								<p>Q&A</p>
							</button>
						</div>

						<div class="btn-group">
							<button type="button" class="btn btn-nav" onclick="marketList()">
								<span class="glyphicon glyphicon-shopping-cart"></span>
								<p>Market</p>
							</button>
						</div>
					</div>
				</div>
				<div class="col-sm-3" align="right">
					<c:choose>
						<c:when test="${sessionScope.mvo==null}">
							<form method="post"
								action="${pageContext.request.contextPath}/front">
								<div class="btn-group">
									<button type="button" class="btn btn-nav" onclick="loginForm()">
										<span class="glyphicon glyphicon-log-in"></span>
										<p>login</p>
									</button>
								</div>
								<div class="btn-group">
									<button type="button" class="btn btn-nav" onclick="registerMemberForm()">
										<span class="glyphicon glyphicon-user"></span>
										<p>Register</p>
									</button>
								</div>

							</form>
						</c:when>
						<c:otherwise>
							<form method="post"
								action="${pageContext.request.contextPath}/front">
								<div class="btn-group">
									<button type="button" class="btn btn-nav" onclick="logout()">
										<span class="glyphicon glyphicon-log-out"></span>
										<p>Log-Out</p>
									</button>
								</div>
								<div class="btn-group">
									<button type="button" class="btn btn-nav" onclick="updateMemberForm()">
										<span class="glyphicon glyphicon-eye-open"></span>
										<p>MyPage</p>
									</button>
								</div>
								<div class="btn-group">
									<button type="button" class="btn btn-nav" onclick="sitemap()">
										<span class="glyphicon glyphicon-asterisk"></span>
										<p>SiteMap</p>
									</button>
								</div>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- 	<div class="row main">
		<div class="col-sm-12">==============================================================================</div>
	</div>
 -->
	<script type="text/javascript">
		var activeEl = 2;
		$(function() {
			var items = $('.btn-nav');
			$(items[activeEl]).addClass('active');
			$(".btn-nav").click(function() {
				$(items[activeEl]).removeClass('active');
				$(this).addClass('active');
				activeEl = $(".btn-nav").index(this);
			});
		});
	</script>

