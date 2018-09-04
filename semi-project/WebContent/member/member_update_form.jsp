<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>      
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">

<script type="text/javascript">

	$(document).ready(function() {

		$("#gomain").click(function() {
			location.href = "${pageContext.request.contextPath}/front?command=home";
		});

		$("#deleteMember").click(function() {
			if(confirm("정말로 탈퇴하실건가요?...ㅠㅠ"))
				location.href = "${pageContext.request.contextPath}/front?command=deleteMember";
			
		});
	});
	function updateMember() {
		location.href = "${pageContext.request.contextPath}/front?command=updateMember";
	}
</script>

<section class="main-container">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="form-block">
					<h2>내 정보 보기</h2>
					<div class="form">
						<form action="${pageContext.request.contextPath }/front" method="post" onsubmit="updateMember()">
							<input type="hidden" name="command" value="updateMember">
							<div class="form-group">
								<h4>아이디</h4>: ${requestScope.findVO.id }
							</div>
							<div class="form-group">
								<h4>이름</h4><input type="text" class="form-control"
									value="${requestScope.findVO.name}" name="name" required>
							</div>
							<div class="form-group">
								<h4>비밀번호</h4><input type="password" class="form-control"
									placeholder="4자이상 10자이하" name="password" required>
							</div>
							<div class="form-group">
								<h4>비밀번호 확인</h4><input type="password" class="form-control"
									placeholder="한번 더 입력하세요" name="repeat-password"
									required>
							</div>
							<div class="form-group">
								<h4>이메일</h4><input type="email" class="form-control"
									value="${requestScope.findVO.email}" name="email" required>
							</div>
							<div class="form-group">
								<h4>생일</h4><input type="date" class="form-control" id="birthday"
									value="${requestScope.findVO.birthday }" name="birthday" required>
							</div>

							<input type="submit" class="btn btn-default custom-btn" value="수정하기">
							<br><br>
							<button type="button" class="btn btn-default custom-btn" id="deleteMember">탈퇴하기</button>
							<br><br>
							<button type="button" class="btn btn-default custom-btn" id="gomain">메인으로</button>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


