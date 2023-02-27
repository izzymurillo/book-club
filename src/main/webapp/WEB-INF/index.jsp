<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login & Registration</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/darkly.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
  <div class="container m-5">
    <div>
      <h1>Welcome!</h1>
      <h6>Join our growing community.</h6>
    </div>
    <div class="d-flex justify-content-around">
      <div class="card m-5">
        <div class="card-header">
          <h2>Register</h2>
        </div>
        <div class="card-body">
          <form:form action="/register" method="post" modelAttribute="newUser" class="form-control mb-3">
            
            <form:label path="userName" class="form-label" ><h4>User Name</h4></form:label>
            <form:errors path="userName" style="color:red"/>
            <form:input path="userName" type="text" class="form-control mb-3" />
            
            <form:label  path="email" class="form-label" ><h4>Email:</h4></form:label>
            <form:errors path="email" style="color:red"/>
            <form:input path="email" type="text" class="form-control mb-3" />
            
            <form:label path="password" class="form-label" ><h4>Password:</h4></form:label>
            <form:errors path="password" style="color:red"/>
            <form:input path="password" type="text" class="form-control mb-3" />
            
            <form:label path="confirm" class="form-label" ><h4>Confirm PW:</h4></form:label>
            <form:errors path="confirm" style="color:red"/>
            <form:input path="confirm" type="text" class="form-control mb-3" />
            
            <div class="d-flex justify-content-end">
              <button class="btn btn-primary m-3" type="submit">
                Submit
              </button>
            </div>
          </form:form>
        </div>
      </div>
      <div class="card m-5">
        
        <div class="card-header">
          <h2>Log in</h2>
        </div>
        <div class="card-body">
          <form:form action="/login" method="post" modelAttribute="newLogin" class="form-control mb-3">
            
            <form:label  path="email" class="form-label" ><h4>Email:</h4></form:label>
            <form:errors path="email" style="color:red"/>
            <form:input path="email" type="text" class="form-control mb-3" />
            
            <form:label path="password" class="form-label" ><h4>Password:</h4></form:label>
            <form:errors path="password" style="color:red"/>
            <form:input path="password" type="text" class="form-control mb-3" />
            
            <div class="d-flex justify-content-end">
              <button class="btn btn-primary m-3" type="submit">
                Submit
              </button>
            </div>
          </form:form>
        </div>
        
      </div>
    </div>
  </div>
  </body>
</html>