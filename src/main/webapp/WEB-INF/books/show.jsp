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
    <title>Read Share</title>
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
        <div class="card-header d-flex justify-content-between p-5">
          <h1>${book.title}</h1>
          <a href="/books">back to the shelves</a>
        </div>
        <div class="card-body p-5">
          <h3 class="card-title mb-4">
            ${book.user.userName} read ${book.title} by ${book.author}.
          </h3>
          <h4 class="card-subtitle mb-4">
            Here are ${book.user.userName}'s thoughts:
          </h4>
          <hr />
          <h5 class="card-text p-5">${book.myThoughts}</h5>
          <hr />
          <div class="d-flex justify-content-end align-items-center">
            
            <!--SHOW EDIT & DELETE ONLY IF LOGGED IN USER POSTED THE BOOK-->
            <c:if test="${book.user.id == userId}">
              <a href="/books/edit/${book.id}" class="btn btn-warning m-3"
                >Edit</a
              >
              <form action="/books/${book.id}" method="post">
                <input type="hidden" name="_method" value="delete" />
                <input class="btn btn-danger" type="submit" value="Delete" />
              </form>
            </c:if>

          </div>
        </div>
      </div>
    </div>
  </body>
</html>
