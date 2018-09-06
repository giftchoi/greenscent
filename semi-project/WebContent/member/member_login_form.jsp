<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>   


 
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">

<script type="text/javascript">
$(document).ready(function() {
 	$("#loginbtn").click(function() {
		//alert("keyup");
		
		var idValue = $("#id").val();
		var pwValue = $("#password").val();
		//var flag = false;
 		//$("#checkResult").html("아이디 중복확인"+a).css("color", "pink");

			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/front",
				data:"command=memberCheck&id="+$("#id").val()+"&password="+$("#password").val(),
				success:function(result){
					//alert(result);
					if(result=="loginok"){
						$("#memberCheck").submit();
					}else {
						$("#loginchecktext").html(result).css("color", "red");
						
					}
				}
			});//ajax
	}); 
}); 

function register(){
	location.href="${pageContext.request.contextPath}/front?command=registerMemberForm";
}
</script>

<section class="main-container">
	<div class="container">
	<div class="form-block">
		<div class="row">
			<div class="col-md-12">
				
					<h2>Login</h2>
					<div class="form">
						<form action="${pageContext.request.contextPath }/front"
							method="post" id="memberCheck">
							<input type="hidden" name="command" value="login">
							<div class="form-group">
								<input type="text" class="form-control" id="id"
									placeholder="아이디" name="id">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password"
									placeholder="비밀번호" name="password">
							</div>
							<span id="loginchecktext"></span>
						</form>
						
					</div>
				
			</div><!-- "col-md-12" -->
			
		</div><!-- row -->
  <div class="row">
    <div class="col-sm-5" >
    	<button class="btn btn-default custom-btn" onclick="register()">회원가입</button>
	</div>
    <div class="col-sm-2">
	</div>
    <div class="col-sm-5">
    	<button id="loginbtn" class="btn btn-default custom-btn">로그인</button>
    </div>
  </div>
  
  </div><!-- form-block -->
	</div><!-- >container -->
</section>

