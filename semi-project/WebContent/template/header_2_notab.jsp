
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
	
<style type="text/css">
/* 
Inspired by http://dribbble.com/shots/890759-Ui-Kit-Metro/attachments/97174
*/
*, *:before, *:after {
	/* Chrome 9-, Safari 5-, iOS 4.2-, Android 3-, Blackberry 7- */
	-webkit-box-sizing: border-box;
	/* Firefox (desktop or Android) 28- */
	-moz-box-sizing: border-box;
	/* Firefox 29+, IE 8+, Chrome 10+, Safari 5.1+, Opera 9.5+, iOS 5+, Opera Mini Anything, Blackberry 10+, Android 4+ */
	box-sizing: border-box;
}

body {
	background: #F5F5F5;
	text-align: center;
	padding-top: 40px;
	text-align: center;
}

.btn-nav {
	background-color: #fff;
	border: 1px solid #e0e1db;
	-webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
	-moz-box-sizing: border-box; /* Firefox, other Gecko */
	box-sizing: border-box; /* Opera/IE 8+ */
}

.btn-nav:hover {
	color: #7FFF00;
	cursor: pointer;
	-webkit-transition: color 1s; /* For Safari 3.1 to 6.0 */
	transition: color 1s;
}

.btn-nav.active {
	color: #006400;
	padding: 2px;
	border-top: 6px solid #7CFC00;
	border-bottom: 6px solid #7CFC00;
	border-left: 0;
	border-right: 0;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-webkit-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
	-moz-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
	-ms-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
	/* IE10 is actually unprefixed */
	-o-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
	transition: border 0.3s ease-out, color 0.3s ease 0.5s;
	-webkit-animation: pulsate 1.2s linear infinite;
	animation: pulsate 1.2s linear infinite;
}

.btn-nav.active:before {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 6px 6px 0;
	border-color: #228B22 transparent;
	display: block;
	width: 0;
	z-index: 1;
	margin-left: -6px;
	top: 0;
	left: 50%;
}

.btn-nav .glyphicon {
	padding-top: 16px;
	font-size: 40px;
}

.btn-nav.active p {
	margin-bottom: 8px;
}

@
-webkit-keyframes pulsate { 50% {
	color: #000;
}

}
@
keyframes pulsate { 50% {
	color: #000;
}

}
@media ( max-width : 480px) {
	.btn-group {
		display: block !important;
		float: none !important;
		width: 100% !important;
		max-width: 100% !important;
	}
}

@media ( max-width : 600px) {
	.btn-nav .glyphicon {
		padding-top: 12px;
		font-size: 26px;
	}
}
</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
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
						<!-- <div class="btn-group btn-group-justified">
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
						</div> -->
					</div>
					<div class="col-sm-2" align="right">
						<c:choose>
							<c:when test="${sessionScope.mvo==null}">
								<form method="post"
									action="${pageContext.request.contextPath}/front">
									<div class="btn-group">
										<button type="button" class="btn btn-nav">
											<span class="glyphicon glyphicon-log-in"></span>
											<p>Log-In</p>
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
