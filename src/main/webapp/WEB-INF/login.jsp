<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <h1>로그인</h1>
    <form action="/login" method="post" onsubmit="return validate()">
      <div class="mb-3">
        <label for="id" class="form-label">아이디</label>
        <input type="text" class="form-control" id="id" />
        <div id="idCheck" class="form-text"></div>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">비밀번호</label>
        <input type="password" class="form-control" id="password" />
        <div id="pwdCheck" class="form-text"></div>
      </div>
      <button type="submit" class="btn btn-dark">로그인</button>
    </form>

    <script src="${pageContext.request.contextPath}/js/login.js"></script>
  </body>
</html>
