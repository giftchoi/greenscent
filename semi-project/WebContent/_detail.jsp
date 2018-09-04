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

	
	function sendList() {
		location.href = "${pageContext.request.contextPath}/index.jsp";
	}
	function deleteDiary() {
		if (confirm("게시글을 삭제하시겠습니까?")) {
			document.deleteForm.submit();
		}
	}
	function updateDiary() {
		if (confirm("게시글을 수정하시겠습니까?")) {
			document.updateForm.submit();
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
<c:if test="${requestScope.dvo.vo.id==sessionScope.mvo.id}">
		<form name="deleteForm"
			action="${pageContext.request.contextPath}/front" method="post">
			<input type="hidden" name="command" value="deleteDiary"> 
			<input type="hidden" name="dno" value="${requestScope.dvo.dno}">
		<button type="button" class="btn" onclick="deleteDiary()">삭제</button></form>
		<form name="updateForm"	action="${pageContext.request.contextPath}/front" method="post">
			<input type="hidden" name="command" value="updateDiaryForm"> 
			<input type="hidden" name="dno" value="${requestScope.dvo.dno}">
		<button type="button" class="btn" onclick="updateDiary()">수정</button></form>
</c:if>
		</td>
	</tr>
</table>

<%-- <c:import url="/reply.jsp" /> --%>
<div class="button-wrapper">
	<c:choose>
		<c:when test="${requestScope.postName eq 'diaryList'}">
			<a class="button w-button"
				href="${pageContext.request.contextPath}/front?command=${postName}">←&nbsp;글
				목록으로 이동</a>
		</c:when>
		<c:when test="${requestScope.postName eq 'publicDiaryList'}">
			<a class="button w-button"
				href="${pageContext.request.contextPath}/front?command=publicDiaryList">←&nbsp;글
				목록으로 이동</a>
		</c:when>
	</c:choose>
	<br>
	<br>
</div>