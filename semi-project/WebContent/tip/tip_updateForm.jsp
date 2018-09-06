<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		var fileTarget = $('.filebox .upload-hidden');
		fileTarget.on('change', function() {
		// 값이 변경되면 
		if (window.FileReader) { // modern browser
		var filename = $(this)[0].files[0].name;
		} else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			}
		// 추출한 파일명 삽입 
			$(this).siblings('.upload-name').val(filename);
				});// function
			$("#picture").change(function() {
			var form = $('#uploadForm')[0];
			var data = new FormData(form);
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/front",
				data : data,
				dataType : "json",
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				cache : false,
				success : function(result) {
				//alert($("#pics").text());
				$("#pics").append("<li>"+ result.orgName+"<input type='hidden' name='pics' value="+result.fileName+"></li>");
				$("#picture").val("");
						}
					});
				});// picture change
				$("#pics").on("click", ".delImg", function() {
					$(this).parent().remove();
				}); //pics
			});
</script>


<div class="container">
	<form action="${pageContext.request.contextPath }/front">
		<input type="hidden" name="command" value="tipUpdate"></input> <input
			type="hidden" name="tNo" value="${tvo.tNo}"></input>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">제목</span>
			</div>
			<input type="text" class="form-control" name="title" value="${tvo.title }">
		</div>
		<div class="form-group">
			<textarea class="form-control" rows="5" name="content">${tvo.content}</textarea>
		</div>

		<br>
		<ul id="pics">
			<c:forEach items="${requestScope.tvo.fileList}" var="tImg">

				<li>${tImg}<input type="button" value="X" class="delImg">
					<input type="hidden" name="pics" value="${tImg}">
				</li>

			</c:forEach>
		</ul>
		<button type="submit" class="btn btn-success">수정</button>
		<!-- <button type="submit" class="btn btn-success">취소</button> -->


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

</body>
</html>