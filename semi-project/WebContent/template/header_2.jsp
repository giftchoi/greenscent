
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
<title>Ui-Kit-Metro Like Nav - Bootsnipp.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
	

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".glyphicon-log-in").click(function() {
			location.href="${pageContext.request.contextPath}/member/member_login_form.jsp";
		});
		$(".glyphicon-log-out").click(function() {
			location.href="${pageContext.request.contextPath}/front?command=logout";
		});
		$(".glyphicon-shopping-cart").click(function() {
			location.href="${pageContext.request.contextPath}/market/market_list.jsp";
		});
	});
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="btn-group btn-group-justified">
				<div class="btn-group">
					<div class="col-sm-2" align="left">
						<img src="${pageContext.request.contextPath }/image/greenscent_logo.gif" width="200" height="100">
					</div>
					<div class="col-sm-8">
						<div class="btn-group btn-group-justified">
							<div class="btn-group">
								<button type="button" class="btn btn-nav">
									<span class="glyphicon glyphicon-home"></span>
									<p>Home</p>
								</button>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-nav">
									<span class="glyphicon glyphicon-calendar"></span>
									<p>Diary</p>
								</button>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-nav">
									<span class="glyphicon glyphicon-book"></span>
									<p>Tip</p>
								</button>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-nav">
									<span class="glyphicon glyphicon-leaf"></span>
									<p>Q&A</p>
								</button>
							</div>
			
							<div class="btn-group">
								<button type="button" class="btn btn-nav">
									<span class="glyphicon glyphicon-shopping-cart"></span>
									<p>Market</p>
								</button>
							</div>
						</div>
					</div>
					<div class="col-sm-2" align="right">
						<c:choose>
							<c:when test="${sessionScope.mvo==null}">
								<form method="post" action="${pageContext.request.contextPath}/front">
									<div class="btn-group">
										<button type="button" class="btn btn-nav" >
											<span class="glyphicon glyphicon-log-in"></span>
												<p>login</p>
											<%-- <a href="${pageContext.request.contextPath}/member/member_login_form.jsp">Log-In</a> --%>
										</button>
									</div>
									<div class="btn-group">
										<button type="button" class="btn btn-nav">
											<span class="	glyphicon glyphicon-user"></span>
											<p>Register</p>
										</button>
									</div>

								</form>
							</c:when>
							<c:otherwise>
								<form method="post"
									action="${pageContext.request.contextPath}/front">
									<div class="btn-group">
										<button type="button" class="btn btn-nav">
											<span class="glyphicon glyphicon-log-out"></span>
											<p>Log-Out</p>
										</button>
									</div>
									<div class="btn-group">
										<button type="button" class="btn btn-nav">
											<span class="glyphicon glyphicon-eye-open"></span>
											<p>MyPage</p>
										</button>
									</div>
									<div class="btn-group">
										<button type="button" class="btn btn-nav">
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
</body>
</html>
