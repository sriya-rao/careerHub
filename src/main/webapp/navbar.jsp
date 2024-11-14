<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.nav-item:hover{
 
 border-radius:10px;
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link text-white" href="login.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link text-white" href="Home.jsp">Search Jobs <span class="sr-only">(current)</span></a>
      </li>
      
       
      </ul>
      <div class="collapse navbar-collapse justify-content-end mr-2">
      
      <c:if test="${empty obj}">
      <div class="nav-bar d-flex align-items-center mr-2">
        <a class="btn btn-light text-dark" href="login.jsp">Login</a>
      </div>
      
      <div class="nav-bar d-flex align-items-center">
        <a class="btn btn-light text-dark" href="Register.jsp">Sign up</a>
      </div>
      </c:if>
      
      <c:if test="${obj.role eq 'admin'}">
      <div class="nav-bar d-flex align-items-center mr-2">
        <a class="btn btn-light text-dark" href="admin.jsp">Admin</a>
      </div>
      </c:if>
      
       <c:if test="${obj.role eq 'user'}">
      <div class="nav-item d-flex align-items-center">
        <button type="button" class="btn btn-light text-dark" data-toggle="modal" data-target="#exampleModal">${obj.name}</button>
      </div>
      </c:if>
      &nbsp;
      
      <c:if test="${not empty obj}">
      <div class="nav-item d-flex align-items-center">
        <a class="btn btn-light text-dark" href="logout">Logout</a>
      </div>
      </c:if>
  </div>
  </div>
</nav>


<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Your Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
 <div class="card">
        <div class="card-body">
        <table class="table">
        <tbody>
        <tr>
        <th>Name</th>
        <th>${obj.name}</th>          
        </tr>
        
        <tr>
        <th>Email</th>
        <th>${obj.email}</th>          
        </tr>
        
        <tr>
        <th>Phone</th>
        <th>${obj.phone}</th>          
        </tr>
        
      
        
        
        </tbody>
        
    
        </table>

        </div>
  </div>
      </div>
      <div class="modal-footer">
        <a href="view_profile.jsp?id=${obj.id}" class="btn btn-success" >view profile</a>
        <a href="profile.jsp" class="btn btn-primary">Update Profile</a>
      </div>
    </div>
  </div>
</div>
</body>
</html>