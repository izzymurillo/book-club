<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Book Share</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/darkly.css" />
    <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
    <!-- change to match your file/naming structure -->
  </head>
  <body>
    <div class="container m-5">
      <div class="card m-5">
        <div class="card-header d-flex justify-content-between">
          <h1>Add a Book to Your Shelf!</h1>
            <a href="/books">back to the shelves</a>
        </div>
        <div class="card-body">
          <form:form
            action="/books"
            method="post"
            modelAttribute="book"
            class="form-control mb-3"
          >
            <!-- Below is a hidden input to assign the book a USER ID from session-->
            <form:hidden path="user" value="${userId}"></form:hidden>

            <form:label path="title" class="form-label"><h4>Title</h4></form:label>
            <form:errors path="title" style="color: red" />
            <form:input path="title" type="text" class="form-control mb-3" />

            <form:label path="author" class="form-label"><h4>Author</h4></form:label>
            <form:errors path="author" style="color: red" />
            <form:input path="author" type="text" class="form-control mb-3" />

            <form:label path="myThoughts" class="form-label"><h4>My thoughts</h4></form:label>
            <form:errors path="myThoughts" style="color: red" />
            <form:textarea path="myThoughts" type="text" rows="5" class="form-control mb-3" />

            <div class="d-flex justify-content-end">
              <button class="btn btn-primary m-3" type="submit">Submit</button>
            </div>
          </form:form>
        </div>
      </div>
    </div>
  </body>
</html>
