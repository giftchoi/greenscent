<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>   


<%-- 
<form action="${pageContext.request.contextPath }/front" method="post">
<input type="hidden" name="command" value="login">
<input type="text" name="id" placeholder="아이디">
<input type="password" name="password" placeholder="비밀번호">
<input type="submit" value="로그인">
</form>
 --%>
 
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">

<section class="main-container">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="form-block">
					<h2>Login</h2>
					<div class="form">
						<form action="${pageContext.request.contextPath }/front"
							method="post">
							<input type="hidden" name="command" value="login">
							<div class="form-group">
								<input type="text" class="form-control" id="id"
									placeholder="아이디" name="id">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="pwd"
									placeholder="비밀번호" name="password">
							</div>
							<button type="submit" class="btn btn-default custom-btn">로그인</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

