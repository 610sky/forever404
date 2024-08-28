<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/movement.css" />
  </head>
  <body>
    <div class="main" id="main">
      <div id="section1"></div>
      <h1>Forever 404</h1>
      <p>어서오세요 환영합니다!</p>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", () => {
        setTimeout(() => {
          document.getElementById("main").classList.add("fade-out");
          setTimeout(() => {
            window.location.href = "/main";
          }, 2000);
        }, 1000);
      });
    </script>
  </body>
</html>
