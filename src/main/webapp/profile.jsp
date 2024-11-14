<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
                <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<c:if test="${empty obj}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="navbar.jsp"%>

<div class="container-fluid mt-4">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-header text-center">
<h4>Update profile</h4>
</div>
<div class="card-body">
<form action=profile method=post>
<div class="form-group">

<input type="hidden" name="id" value="${obj.id}">


    <label>Full Name</label>
    <input type="text" class="form-control" name="name" placeholder="Enter name" value="${obj.name }">
  </div>
  <div class="form-group">
    <label>Phone number</label>
    <input type="text" class="form-control" name="phone" placeholder="Enter number" value="${obj.phone }">
  </div>
  <div class="form-group">
    <label>Email address</label>
    <input type="email" class="form-control" name="email" placeholder="Enter email" value="${obj.email }">
  </div>
  <div class="form-group">
    <label>Education</label>
    <input type="text" class="form-control" name="edu" placeholder="Education">
  </div>
  <div class="form-group">
    <label>Experience</label>
    <input type="text" class="form-control" name="exp" placeholder="Company name">
  </div>
  <div class="form-group">
    <input type="text" class="form-control" name="years" placeholder="years">
  </div>
  
  <div class="text-center">
  <button type="submit" class="btn btn-primary">Update</button><hr>
  
  </div>
</form>
</div>
<c:if test="${not empty msg}">
  <div class="alert alert-success alert-dismissible fade show" role="alert">

  <strong>${msg} </strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
  
</div>
<c:remove var="msg"/>
</c:if>
<c:if test="${not empty error}">
<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>${error} </strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<c:remove var="error"/>
</c:if>

</div>
</div>
</div>
</div>
</body>
</html>