<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!-- <div class="container"> -->
  <form action="/action_page.php">
    <div class="form-group">
      <label for="comment">댓글달기:</label>
      <textarea class="form-control" rows="1" id="comment" name="text"></textarea>
    </div>
    <button type="submit" class="btn btn-success">Submit</button>
  </form>
  <br><br><br>
  <p align="left">댓글 (갯수)</p>
	<br>
  <h6 align="left">댓글 단 아이디</h6>
  <div class="card">
    <div class="card-body" align="left">댓글내용</div>
  </div>
<!-- </div> -->