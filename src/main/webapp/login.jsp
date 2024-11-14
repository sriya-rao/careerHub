<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
                <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
body{
background-image:url("./images/career.png");
background-repeat: no-repeat;
background-size: cover;
}
.card-header{
color
}
</style>

<body>
<%@include file="navbar.jsp"%>
<div class="container-fluid mt-4">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-header text-center bg bg-primary">
<h4 class="text-white">Sign In!!</h4>
</div>
<div class="card-body">
<form action=login method=post>
  <div class="form-group">
    <label>Email address</label>
    <input type="email" class="form-control" name="email" placeholder="Enter email" required>
  </div>
  <div class="form-group">
    <label>Password</label>
    <input type="password" class="form-control" name="pwd" placeholder="Password" required>
  </div>
  <div class="text-center">
  <input type="submit" class="btn btn-primary"><hr>
  <a href="Register.jsp">New User? Register Here</a>
  </div>
</form>
</div>
<c:if test="${not empty error}">
<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>${error} </strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<c:remove var="error"/>
</c:if>

<c:if test="${not empty msg}">
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>${msg} </strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<c:remove var="msg"/>
</c:if>
</div>
</div>
</div>
</div>
</body>
</html>