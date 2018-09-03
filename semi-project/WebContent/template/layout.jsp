<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 지선 head -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

<!-- 준상형 head  -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- 준위 head -->
<meta content="width=device-width, initial-scale=1" name="viewport">
<link href="https://daks2k3a4ib2z.cloudfront.net/56d3f1b99aaa616f508a6253/css/lamar-template.webflow.302b71073.css"
	rel="stylesheet" type="text/css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  	
  	
<title>Insert title here</title>
</head>
<body>
<!-- container-fluid: 화면 너비와 상관없이 항상 100% -->
<div class="container-fluid">
  <div class="row header">
    
    
    
	<!-- 어제 맞춰본 header -->
    <%-- <div class="col-sm-12">
   		<c:import url="/template/header.jsp"></c:import>
    </div> --%>
    
	<!-- 준상형이 따로 보낸 header (gif로고 적용) -->
    <div class="col-sm-12" align="right">
    	<c:import url="/template/header_2.jsp"></c:import>
    </div>
    
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
	<%-- <c:import url="/post_list.jsp"></c:import> --%>

	<!-- 글 작성 화면 -->
	<%-- <c:import url="/testRegisterForm.jsp"></c:import>
 --%>
	
    </div>
  </div>
</div>
</body>
</html>