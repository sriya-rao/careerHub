<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<c:if test="${obj.role ne 'admin'}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>



<%@include file="navbar.jsp"%>

<div class="container">

<div class="row mt-3">

<div class="col-4">
<div class="card" style="width: 18rem;">
<div class="card-header text-center">
  <img src="" style="max-height:200px;max-width:100%;width:auto;" class="card-img-top" alt="...">
  </div>
  <div class="card-body ">
    <h5 class="card-title">Posts</h5>
    <p class="card-text"></p>
    <a href="#" class="btn btn-primary">Total Posts</a>
  </div>
</div>
</div>

<div class="col-4">
<div class="card" style="width: 18rem;">
<div class="card-header text-center">

  <img src="images/post.jpg" style="max-height:200px;max-width:100%;width:auto;" class="card-img-top" alt="...">
  </div>
  <div class="card-body">
    <h5 class="card-title">Post Job</h5>
    <p class="card-text"></p>
      <a href="post_job.jsp" class="btn btn-primary">Add </a>
  
 </div>
</div>
</div>

<div class="col-4">
<div class="card" style="width: 18rem;">
<div class="card-header text-center">

  <img src="images/categories.png" style="max-height:200px;max-width:100%;width:auto;" class="card-img-top" alt="...">
  </div>
  <div class="card-body">
    <h5 class="card-title">View Jobs</h5>
    <p class="card-text"></p>
    <a href="view.jsp" class="btn btn-primary">View</a>
  </div>
</div></div>

</div>

</div>

</body>
</html>