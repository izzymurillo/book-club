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
  <div class="container">
    <div class="card m-5">
      <div class="card-header p-5">
        <div class="d-flex justify-content-between">
          <h1>
            Welcome, ${userName}!
          </h1>
          <a href="/logout">Logout</a>
        </div>
      </div>
      <div class="card-body p-5">
        <div class="d-flex justify-content-between card-title">
          <h5>
            Books from everyone's shelves:
          </h5>
          <a href="/books/new">+ Add a book to my shelf!</a>
        </div>
        <table class="table table-bordered mt-4">
          <thead>
            <tr>
              <th scope="col"><h5>ID</h5></th>
              <th scope="col"><h5>Title</h5></th>
              <th scope="col"><h5>Author Name</h5></th>
              <th scope="col"><h5>Posted By</h5></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="book" items="${books}">

              <tr>
                <th scope="row"><h5></h5>${book.id}</th>
                <td><h5><a href="/books/${book.id}">${book.title}</a></h5></td>
                <td><h5>${book.author}</h5></td>
                <td><h5>${book.user.userName}</h5></td>
              </tr>
            </c:forEach>
          </tbody>

        </table>
      </div>
    </div>
  </div>
</body>
</html>