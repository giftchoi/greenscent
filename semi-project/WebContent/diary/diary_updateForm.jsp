<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <form action="${pageContext.request.contextPath}/front">
  <input type="hidden" name=command value="updateDiary">
  <input type="hidden" name=dno value="${dvo.dno}">
	 <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control" name="title" value="${dvo.title}">
    </div>
    <div class="form-group">
      <textarea class="form-control" name="content">${dvo.content}</textarea>
    </div>
    <div class="form=group">
    <input type="radio" name="secret" value="1"> 다른사람과 공유
    <input type="radio" name="secret" value="0"> 비공개
    </div>
    <button type="submit" class="btn btn-success">글쓰기</button>
  </form>
</div>

</body>
</html>