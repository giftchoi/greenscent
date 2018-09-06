<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(
			function() {
				var fileTarget = $('.filebox .upload-hidden');
				fileTarget.on('change', function() {
					// 값이 변경되면 
					if (window.FileReader) { // modern browser
						var filename = $(this)[0].files[0].name;
					} else { // old IE 
						var filename = $(this).val().split('/').pop().split(
								'\\').pop(); // 파일명만 추출 
					}
					// 추출한 파일명 삽입 
					$(this).siblings('.upload-name').val(filename);
				});// function
				
				$("#picture").change(function() {
					var form = $('#uploadForm')[0];
					var data = new FormData(form);
					$.ajax({
						type: "post",
						url: "${pageContext.request.contextPath}/front",
						data: data,
						dataType: "json",
						enctype: 'multipart/form-data',
						processData: false ,
						contentType: false , 
						cache: false , 
					success:function(result){
						//alert("#pics").val();
						$("#pics").append("<li>"+result.orgName+"<input type='hidden' name='pics' value="+result.fileName+"></li>");
						$("#picture").val("");
					}
					});
				});
			});
</script>

<div class="container">

	<script type="text/javascript">
		function tipWrite() {
			location.href = "${pageContext.request.contextPath }/front?command=tipRegister";
		}
	</script>
	<form action="${pageContext.request.contextPath }/front" method="post">
		<input type="hidden" name="command" value=tipRegister> 
		

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">제목</span>
			</div>
			<input type="text" class="form-control" name="title"
				placeholder="제목을 입력하세요">

		</div>
		<div class="form-group">
			<textarea class="form-control" rows="5" name="content"
				placeholder="본문내용을 입력하세요"></textarea>
		</div>

			<ui id="pics"></ui>
			<c:choose>
				<c:when test="${sessionScope.mvo.id==null}">
				<button type="button" class="btn btn-success" onclick="goLogin()">글쓰기</button>
					<script type="text/javascript">
						function goLogin(){
							alert("글쓰기는 로그인 후 가능합니다");
							location.href="${pageContext.request.contextPath}/front?command=loginForm";
						}
					</script>
				</c:when>
				<c:otherwise>
					<button type="submit" class="btn btn-success">글쓰기</button>
				</c:otherwise>
			</c:choose>
			
		
		
	</form>
	<form id="uploadForm" method="post" enctype="multipart/form-data">
		<!-- 아래의 방법과 맨 윗줄의 jQuery를 사용해서 파일박스 모양을 변경하고 파일이름이 들어가게 함  -->
		<div class="filebox">
			<input class="upload-name" value="picture" disabled="disabled">
			<label for="picture">업로드</label> <input type="file" name="picture"
				id="picture" class="upload-hidden">
		</div>
	</form>
</div>


