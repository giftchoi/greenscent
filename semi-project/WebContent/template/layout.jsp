<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 공통 초기선언 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:choose>
	<c:when test="${url=='/template/main.jsp'}">
		<!-- 지선 head (메인화면) -->
		<link
			href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
			rel="stylesheet" id="bootstrap-css">
		<script
			src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
			integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
			crossorigin="anonymous">

		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/css/main.css">
	</c:when>
	
	
	<c:when test="${url=='/_detail.jsp'}">
		<!-- 준위 head(글 상세보기, 댓글) -->
		
  		<%--
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		 --%>
	</c:when>


	<c:when test="${url=='/_list.jsp'}">
		<!-- 호영 head(글 목록) -->
		<link
			href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
			rel="stylesheet" id="bootstrap-css">
		<script
			src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<link rel='stylesheet prefetch'
			href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/css/post_list.css">
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/css/paging.css">
	</c:when>

	<c:when test="${url=='/register_post_form.jsp'}">
		<!-- 성진 head (글 쓰기) -->
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> 
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		
	</c:when>
</c:choose>

<!-- 준상형 head  -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">

<!-- 공통 후반선언 -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<title>초록향</title>
</head>


<body>
<!-- container-fluid: 화면 너비와 상관없이 항상 100% -->
<div class="container-fluid">
  <div class="row header">

			<c:choose>
				<c:when test="${url=='/template/main.jsp'}">
					<div class="col-sm-12">
						<c:import url="/template/header_2_notab.jsp"></c:import>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-sm-12" align="right">
						<c:import url="/template/header_2.jsp"></c:import>
					</div>
				</c:otherwise>
			</c:choose>
			

    
  </div>
  <div class="row main">
    
    <div class="col-sm-12">
    <!-- url 전달부분 -->
	<c:import url="${url}"></c:import>
	
	<!-- 메인화면 -->
<%-- 	<c:import url="/template/main.jsp"></c:import> 
 --%>	
	<!-- 글 상세보기 화면 -->
<%-- 	<c:import url="/_detail.jsp"></c:import>
 --%>	
	<!-- 글 목록 화면 -->
<%-- 	<c:import url="/_list.jsp"></c:import>
 --%>
	<!-- 글 작성 화면 -->
<%-- 	<c:import url="/register_post_form.jsp"></c:import>
--%>
	
    </div>
  </div>
</div>
</body>
</html>