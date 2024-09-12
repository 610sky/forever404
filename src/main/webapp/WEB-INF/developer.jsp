<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ForeverCalendar-Intro</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/reset.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/developer.css"
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
        // user 세션 존재 시 자동으로 main 이동
        window.location.href = "/movement";
      </script>
    </c:if>
    <!-- 헤더 -->
    <header id="header">
      <a href="/">
        <h1 class="nav-link">
          Forever <span class="red">4</span><span class="white">0</span
          ><span class="red">4</span>
        </h1></a
      >
      <nav id="a2">
        <button
          type="button"
          class="nav-link"
          onclick="location.href='/developer'"
        >
          개발자
        </button>
        <button type="button" class="nav-link" id="login">로그인</button>
        <button
          type="button"
          class="nav-link"
          onclick="location.href='/register'"
        >
          회원가입
        </button>
      </nav>
    </header>
    <!-- section -->
    <div class="main">
      <section id="section1">
        <h1>Forever 404는 협업하며</h1>
        <h1>성장하는 유망주들입니다.</h1>
        <br /><br />
        <p>따뜻한 분위기와, 열정 가득한 팀워크,</p>
        <p>그리고 소통하는 협업으로 지금도 성장하고있습니다.</p>
      </section>
      <section id="section2"></section>
    </div>
    <div class="profile">
      <section id="back-end">
        <h1>back-end Members</h1>
        <section class="members">
          <section id="member1">
            <img
              src="${pageContext.request.contextPath}/image/developer/아침새2.png"
              alt=""
            />
            <h2>윤유진(팀장)</h2>
            <ul>
              <li>사용 언어 및 기술 : Java, Java Script, jQuery, MySql</li>
              <li>한일1 : 이미지 크롤링</li>
              <li>한일2 : 그룹 관련 데이터베이스 추가, 삭제, 읽기 기능 구현</li>
              <li>
                한일3 : 스케줄 관련 데이터베이스 추가, 삭제, 읽기 기능 구현
              </li>
              <li>한일4 : 예외처리 구현</li>
            </ul>
          </section>
          <section id="member2">
            <img
              src="${pageContext.request.contextPath}/image/developer/쿼카1.jpg"
              alt=""
              id="park"
            />
            <h2>박세영</h2>
            <ul>
              <li>사용 언어 및 기술 : Java, Java Script, jQuery, MySql</li>
              <li>한일1 : 회원가입 및 로그인 기능</li>
              <li>한일2 : 그룹 관련 데이터베이스 추가, 삭제, 읽기 기능 구현</li>
              <li>
                한일3 : 스케줄 관련 데이터베이스 추가, 삭제, 읽기 기능 구현
              </li>
              <li>한일4 : 카카오 로그인 및 openAI API 활용</li>
            </ul>
          </section>
          <section id="member3">
            <img
              src="${pageContext.request.contextPath}/image/developer/고양이3.jpg"
              alt=""
            />
            <h2>김진주</h2>
            <ul>
              <li>사용 언어 및 기술 : Java, Java Script, jQuery, MySql</li>
              <li>한일1 : 카카오맵 API 활용</li>
              <li>한일2 : 그룹 관련 데이터베이스 추가, 삭제, 읽기 기능 구현</li>
              <li>
                한일3 : 스케줄 관련 데이터베이스 추가, 삭제, 읽기 기능 구현
              </li>
              <li>한일4 : css 애니메이션 기능 구현</li>
            </ul>
          </section>
        </section>
      </section>
      <section id="front-end">
        <h1>front-end Members</h1>
        <section class="members">
          <section id="member4">
            <img
              src="${pageContext.request.contextPath}/image/developer/오카피1.jpg"
              alt=""
            />
            <h2>장영태</h2>
            <ul>
              <li>사용 언어 : HTML, CSS, JS, JQUERY</li>
              <li>한일2 : register 페이지 HTML, CSS 구축</li>
              <li>한일3 : login 페이지 HTML, CSS 구축</li>
              <li>
                한일4 : main 페이지 FullCalendar, HTML, CSS, JS, JQUERY 구축
              </li>
              <li>한일5 : main 페이지 일정, 상세 일정 모달 구축</li>
            </ul>
          </section>
          <section id="member5">
            <img
              src="${pageContext.request.contextPath}/image/developer/카피바라1.jpg"
              alt=""
            />
            <h2>배영운</h2>
            <ul>
              <li>사용 언어 : HTML, CSS, JAVASCRIPT, JQUERY</li>
              <li>한일2 : INDEX페이지 구축</li>
              <li>한일3 : DETAIL페이지 HTML, CSS, JAVASCRIPT, JSTL 구축</li>
              <li>한일4 : KAKAOMAP페이지 HTML, CSS 구축</li>
              <li>한일5 : MAIN페이지 서브 CSS, JAVASCRIPT</li>
            </ul>
          </section>
        </section>
        <section id="blank"></section>
      </section>
    </div>
    <!-- 로그인 모달 -->
    <div class="modal">
      <div class="modal_body">
        <div class="back_to_menu">
          <a href=""><i class="fa-solid fa-xmark"></i></a>
        </div>
        <div class="mainsbj">
          <h1>로그인</h1>
        </div>
        <div class="user_login">
          <i class="fa-regular fa-user"></i>
          <input
            type="text"
            class="user_id_input"
            id="id"
            name="id"
            placeholder="아이디"
            required
          />
        </div>
        <div class="user_login">
          <i class="fa-solid fa-lock"></i>
          <input
            type="password"
            class="user_password_input"
            id="password"
            name="password"
            placeholder="비밀번호"
            required
          />
        </div>
        <div class="login_btn">
          <button type="submit" id="login2">로그인</button>
        </div>
        <div class="kkt_login_btn">
          <a href="javascript:kakaoLogin();">
            <img
              src="${pageContext.request.contextPath}/image/main/kakao.png"
              alt="카카오 로그인 버튼"
            />
          </a>
          <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
          <script>
            // 카카오 script 키
            Kakao.init("416439531d0e4d8f33eb240c9b791ffb");
          </script>
          <script>
            //카카오 로그인 키
            function kakaoLogin() {
              window.Kakao.Auth.login({
                scope: "account_email, name, birthyear, phone_number",
                success: function (authObj) {
                  const accessToken = authObj.access_token;
                  window.Kakao.Auth.setAccessToken(accessToken);

                  window.Kakao.API.request({
                    url: "/v2/user/me",
                    success: function (res) {
                      const kakao_account = res.kakao_account;
                      const formData = {
                        email: kakao_account.email,
                        name: kakao_account.name,
                        birthday: kakao_account.birthday,
                        birthyear: kakao_account.birthyear,
                        phone: kakao_account.phone_number,
                        token: accessToken,
                      };

                      // jQuery AJAX 요청
                      $.ajax({
                        url: "/kakaoLogin",
                        method: "POST",
                        data: formData,
                        success: function (response) {
                          // 요청이 성공했을 때 수행할 작업
                          window.location.href = "/main";
                          location.reload();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                          // 요청이 실패했을 때 수행할 작업
                          console.error(
                            "Login failed: ",
                            textStatus,
                            errorThrown
                          );
                        },
                      });
                    },
                  });
                },
                fail: function (error) {
                  console.error("Kakao login failed: ", error);
                },
              });
            }
          </script>
        </div>
      </div>
    </div>
    <script>
      // 개발진 소개 시 발생하는 애니메이션 스크립트
      document.addEventListener("DOMContentLoaded", () => {
        const observerOptions = {
          root: null,
          rootMargin: "0px",
          threshold: 0.1,
        };
        const observer = new IntersectionObserver((entries) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting) {
              entry.target.classList.add("fade-in");
              entry.target.classList.remove("fade-out");
            } else {
              entry.target.classList.add("fade-out");
              entry.target.classList.remove("fade-in");
            }
          });
        }, observerOptions);
        const elements = document.querySelectorAll(
          "#back-end .members section"
        );
        elements.forEach((element) => {
          observer.observe(element);
        });
        const elements2 = document.querySelectorAll(
          "#front-end .members section"
        );
        elements2.forEach((element) => {
          observer.observe(element);
        });
      });
      const modal = document.querySelector(".modal");
      const btnOpenModal = document.querySelector("#login");
      btnOpenModal.addEventListener("click", () => {
        modal.style.display = "flex";
      });
      document.addEventListener("keydown", (e) => {
        if (e.key === "Escape" && modal.style.display === "flex") {
          modal.style.display = "none";
        }
      });
    </script>
    <script>
      // 로그인 jQuery + ajax 방식 데이터
      $("#login2").click(() => {
        $.ajax({
          type: "post",
          url: "/login",
          data: {
            id: $("#id").val(),
            password: $("#password").val(),
          },
          success: function (response) {
            if (response == true) {
              window.location.href = "/movement";
              location.reload();
            } else {
              alert("아이디 혹은 비밀번호가 잘못되었습니다");
            }
          },
        });
      });
    </script>
  </body>
</html>
