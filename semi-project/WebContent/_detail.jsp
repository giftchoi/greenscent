<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table">
	<tr>
		<td colspan="5">제목 ${vo.title }</td>
	</tr>
	<tr>
		<td>글번호  1${vo.no }</td>
		
		<td>작성자 문준위${vo.vo.name }</td>
		<td>조회수 ${vo.hits }</td>
		
		<td>2018-09-04${vo.regDate }</td>
	</tr>
	</table>
<!-- image-slider 선언부 -->
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/assets/img-slider-pro/dist/css/slider-pro.min.css" media="screen" />
		<%--<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/assets/img-slider-pro/libs/fancybox/jquery.fancybox.css" media="screen" />
		 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/img-slider-pro/example/css/examples.css"
			media="screen" /> --%>
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600'
			rel='stylesheet' type='text/css'>

		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/img-slider-pro/libs/jquery-1.11.0.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/assets/img-slider-pro/dist/js/jquery.sliderPro.min.js"></script>
		<%-- <script type="text/javascript"
			src="${pageContext.request.contextPath}/assets/img-slider-pro/libs/fancybox/jquery.fancybox.pack.js"></script>	--%>
<script type="text/javascript">
	$( document ).ready(function( $ ) {
		
		$( '#pictureslide' ).sliderPro({
			width: '50%',
			height: 500,
			aspectRatio: 1.5,
			visibleSize: '100%',
			forceSize: 'fullWidth'
		});

		// instantiate fancybox when a link is clicked
		$( '#example2 .sp-image' ).parent( 'a' ).on( 'click', function( event ) {
			event.preventDefault();

			// check if the clicked link is also used in swiping the slider
			// by checking if the link has the 'sp-swiping' class attached.
			// if the slider is not being swiped, open the lightbox programmatically,
			// at the correct index
			if ( $( '#pictureslide' ).hasClass( 'sp-swiping' ) === false ) {
				$.fancybox.open( $( '#pictureslide .sp-image' ).parent( 'a' ), { index: $( this ).parents( '.sp-slide' ).index() } );
			}
		});
	});

	
	function deletePost() {
		if (confirm("게시글을 삭제하시겠습니까?")){
			location.href="front?command=DeletePost&tno=${vo.tno}";
		}
	}
	function editPost() {
		if (confirm("게시글을 수정하시겠습니까?")){
			location.href="front?command=EditPostForm&tno=${vo.tno}";
		}
	}

</script>
<div id="pictureslide" class="slider-pro">
	<div class="sp-slides">
		<div class="sp-slide">
			<a href="http://bqworks.com/slider-pro/images/image1_large.jpg">
				<img class="sp-image" src="${pageContext.request.contextPath}/assets/img-slider-pro/src/css/images/blank.gif"
				data-src="http://bqworks.com/slider-pro/images/image1_medium.jpg"
				data-retina="http://bqworks.com/slider-pro/images/image1_large.jpg" />
			</a>
			<p class="sp-caption">1번 사진</p>
		</div>

		<div class="sp-slide">
			<a href="http://bqworks.com/slider-pro/images/image2_large.jpg">
				<img class="sp-image" src="${pageContext.request.contextPath}/assets/img-slider-pro/src/css/images/blank.gif"
				data-src="http://bqworks.com/slider-pro/images/image2_medium.jpg"
				data-retina="http://bqworks.com/slider-pro/images/image2_large.jpg" />
			</a>
			<p class="sp-caption">2번 사진</p>
		</div>

		<div class="sp-slide">
			<a href="http://bqworks.com/slider-pro/images/image3_large.jpg">
				<img class="sp-image" src="${pageContext.request.contextPath}/assets/img-slider-pro/src/css/images/blank.gif"
				data-src="http://bqworks.com/slider-pro/images/image3_medium.jpg"
				data-retina="http://bqworks.com/slider-pro/images/image3_large.jpg" />
			</a>
			<p class="sp-caption">Ut enim ad minim veniam, quis nostrud
				exercitation ullamco laboris nisi ut aliquip ex ea commodo.</p>
		</div>

		<div class="sp-slide">
			<a href="http://bqworks.com/slider-pro/images/image4_large.jpg">
				<img class="sp-image" src="${pageContext.request.contextPath}/assets/img-slider-pro/src/css/images/blank.gif"
				data-src="http://bqworks.com/slider-pro/images/image4_medium.jpg"
				data-retina="http://bqworks.com/slider-pro/images/image4_large.jpg" />
			</a>
			<p class="sp-caption">Duis aute irure dolor in reprehenderit in
				voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
		</div>

	</div>
</div>
<table class="table">
	<tr>
		<td colspan="5">

		<pre>
		${requestScope.vo.content }
		</pre>
		</td>
	</tr>
	<tr>
		<td colspan="5" class="btnArea">
<c:choose>
	<c:when test="${sessionScope.mvo.name == requestScope.vo.vo.name }">
	<input type="button" name="DeletePost" class="btn" value="삭제" onclick="deletePost()">
	<input type="button" name="EditPost" class="btn" value="수정" onclick="editPost()">
	</c:when>
</c:choose>
		</td>
	</tr>
</table>

<c:import url="/reply.jsp" />
