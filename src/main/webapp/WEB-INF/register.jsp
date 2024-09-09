<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/reset.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/register.css"
    />
    <script
      src="https://kit.fontawesome.com/ef885bd654.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  </head>
  <body>
  <c:if test="${not empty user}">
  	<script>
  	window.location.href = "/movement";
  	</script>
  </c:if>
    <div class="registersection">
      <div class="background">
        <video class="video1" autoplay muted loop>
          <source src="/video/29777-377520664_medium.mp4" />
        </video>
      </div>
      <h1>
        <button onclick="history.back()" id="back">
          <i class="fa-solid fa-arrow-left"></i>
        </button>
      </h1>
      <div class="formlist">
        <div class="form">
          <div class="user_id" id="user_id">
            <label>
              <i class="fa-regular fa-user"></i>
              <input
                type="text"
                name="id"
                id="id"
                placeholder="회원 아이디"
                class="user_id"
                autocapitalize="off"
            /></label>
            <span id="userIdSpan"
              >* 아이디는 무조건 영소문자, 숫자 포함 20자 이하여야합니다.</span
            >
          </div>
          <div class="user_password" id="user_password">
            <label>
              <i class="fa-solid fa-lock"></i>
              <input
                type="password"
                name="password"
                id="password"
                placeholder="회원 비밀번호"
                class="user_password"
                autocapitalize="off"
            /></label>
            <span id="userPasswordSpan"
              >* 비밀번호는 영소문자, 숫자, 특수문자 포함 8자리
              이상이여야합니다.</span
            >
          </div>
          <div class="user_phone">
            <label>
              <i class="fa-solid fa-mobile-screen-button"></i>
              <input
                type="text"
                name="phone"
                id="phone"
                placeholder="회원 휴대전화번호 (선택사항)"
                class="user_phone"
            /></label>
          </div>
          <div class="user_name">
            <label>
              <i class="fa-regular fa-user"></i>
              <input
                type="text"
                name="name"
                id="name"
                placeholder="회원 이름"
                class="user_name"
                required
            /></label>
            <span id="userNameSpan">* 이름은 필수입니다! (2글자 이상)</span>
          </div>
          <div class="user_email" id="user">
            <label>
              <i class="fa-regular fa-envelope"></i>
              <input
                type="text"
                name="email"
                id="email"
                placeholder="회원 이메일 (선택사항)"
                class="user_email"
                autocapitalize="off"
            /></label>
          </div>
          <div class="user_birth" id="user">
            <label for="birth">
              <i class="fa-solid fa-calendar-days"></i>
              <input
                type="date"
                name="birth"
                id="birth"
                placeholder="회원 생년월일 (선택사항)"
                class="user_birth"
                max="9999-12-31"
            /></label>
          </div>
        </div>
      </div>
      <div class="submit_btn">
        <input type="submit" id="submit" value="회원가입하기!" />
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/register.js"></script>
  </body>
</html>