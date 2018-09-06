<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- image-slider 선언부 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/img-slider-pro/dist/css/slider-pro.min.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/img-slider-pro/libs/fancybox/jquery.fancybox.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/img-slider-pro/example/css/examples.css"
	media="screen" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600'
	rel='stylesheet' type='text/css'>
<script src="https://code.jquery.com/jquery-2.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/img-slider-pro/libs/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/img-slider-pro/dist/js/jquery.sliderPro.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/img-slider-pro/libs/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript">

<script type="text/javascript">
$( document ).ready(function( $ ) {
    
    $('#pictureslide').sliderPro({
       width: '50%',
       height: 500,
       aspectRatio: 1.5,
       visibleSize: '100%',
       forceSize: 'fullWidth'
    });

    // instantiate fancybox when a link is clicked
    $('#example2 .sp-image').parent('a').on('click', function(event) {
       event.preventDefault();

       // check if the clicked link is also used in swiping the slider
       // by checking if the link has the 'sp-swiping' class attached.
       // if the slider is not being swiped, open the lightbox programmatically,
       // at the correct index
       if ($('#pictureslide').hasClass('sp-swiping') === false ) {
          $.fancybox.open($('#pictureslide .sp-image').parent('a'), {index:$(this).parents('.sp-slide').index()});
       }
    });
    
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
			type: "post",
			url: "${pageContext.request.contextPath}/front",
			data: data,
			dataType: "json",
			enctype: 'multipart/form-data',
			processData: false ,
			contentType: false , 
			cache: false , 
		success:function(result){
			$("#pics").append("<li>"+result.orgName+"<input type='hidden' name='pics' value="+result.fileName+"></li>");
			$("#picture").val("");
		}
		});
	});
 });
 

</script>


<div id="pictureslide" class="slider-pro">
   			<div class="sp-slides">
   				<c:forEach var="qImg" items="${requestScope.qvo.fileList}">
	   				<div class="sp-slide">
	   					<img class="sp-image" 
	   						src="${pageContext.request.contextPath}/uploadImg/${qImg}"
	            			data-src="${pageContext.request.contextPath}/uploadImg/${qImg}"
	          				data-retina="http://bqworks.com/slider-pro/images/image1_large.jpg" />
	   				</div>		
   				</c:forEach>
      		</div>
   		</div>

<div class="container">
  <form action="${pageContext.request.contextPath }/front" method="post">
  <input type="hidden" name="command" value="updateQna"></input>
  <input type="hidden" name="qNo" value="${qvo.qNo}"></input>
	 <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text"></span>
      </div>
      <input type="text" class="form-control" name="title" value="${qvo.title }">
  
    </div>
    <div class="form-group">
      <textarea class="form-control" rows="20" name="content" >${qvo.content}</textarea>
    </div>
    <button type="submit" class="btn btn-success">수정</button>
    <button type="reset" class="btn btn-success">취소</button>
  </form>
   <ui id="pics"></ui>
  <form id="uploadForm" method="post" enctype="multipart/form-data">
		<!-- 아래의 방법과 맨 윗줄의 jQuery를 사용해서 파일박스 모양을 변경하고 파일이름이 들어가게 함  -->
		<div class="filebox">
			<input class="upload-name" value="picture" disabled="disabled">
			<label for="picture">업로드</label> <input type="file" name="picture"
				id="picture" class="upload-hidden">
		</div>
	</form>
</div>
