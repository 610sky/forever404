<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/semi.css" />
    <script
    src="https://kit.fontawesome.com/ef885bd654.js"
    crossorigin="anonymous"
  ></script>
  </head>
  <body>
    <header id="header">
      <nav id="a1">
      <a href="">
        <h1 class="nav-link">
          Forever
        </h1>
        </a >
        <a href=""><img src="${pageContext.request.contextPath}/image/main/404.png" /></a>
      </nav>

      <nav id="a2">
        <button
          type="button"
          class="nav-link"
          onclick="location.href='/developer'"
        >
          개발자
        </button>
        <button type="button" class="nav-link" id="login">로그인</button>
        <button type="button" class="nav-link" onclick="location.href='/register'">
          회원가입
        </button>
      </nav>
    </header>

    <div className="main">
      <div id="carousel">
        <button id="prevBtn" class="button2">&#10094;</button>
        <div id="sectioncontainer">
          <section class="section" id="section1">
            <h1>트러블 없는 트래블 스케줄러,(적당한 멘트)</h1>
            <br />
            <h1>"SEMI PROJECT"<프로젝트제목></h1>
            <h2><a id="scrollLink">자세히 보기</a></h2>
          </section>
          <section class="section" id="section2">
            <h1>심플한 여행스케줄러,</h1>
            <h1>복잡한 방식에 지친 당신을 위한.(적당한 멘트)</h1>
          </section>
          <section class="section" id="section3">
            <h1>그룹의 스케줄을 한 눈에!</h1>
          </section>
          <section class="section" id="section4">
            <h1>유용한 기능2(적당한 멘트)</h1>
          </section>
        </div>
        <button id="nextBtn" class="button2">&#10095;</button>
      </div>
      <section id="section5">
        <h1>이 스케줄러의 장점</h1>
        <p>전체 여행 일정을 한눈에 !</p>
        <img src="${pageContext.request.contextPath}/image/main/schedule.jpg" alt="" />
      </section>
      <section id="section6">
        <div id="textBox">
          <h1>이 외의 유용한 기능들</h1>
          <p>세부 일정을 요일, 시간 별로 확인해 보세요.</p>
          <p>자주 잊어먹는 분들을 위한 알람 기능</p>
        </div>
        <div id="positionBox">
          <div class="box" id="box1">
            <img src="${pageContext.request.contextPath}/image/main/calender2.jpg" />
          </div>
          <div class="box" id="box2">
            <img src="${pageContext.request.contextPath}/image/main/plane.jpg"/>
          </div>
        </div>
      </section>

<!-- 로그인 부분 -->
      <div class="modal">
        <div class="modal_body">
          <div class="back_to_menu">
            <a href=""><i class="fa-solid fa-xmark"></i></a>
          </div>
          <div class="mainsbj">
            <h1>로그인</h1>
          </div>
          <div class="user_login">
          <label for="id">
            <i class="fa-regular fa-user"></i>
            <input
              type="text"
              class="user_id_input"
              id="id"
              name="id"
              placeholder="아이디"
              required
            /></label>
          </div>
          <div class="user_login">
          <label for="password">
            <i class="fa-solid fa-lock"></i>
            <input
              type="text"
              class="user_password_input"
              id="password"
              name="password"
              placeholder="비밀번호"
              required
            /></label>
          </div>
          <div class="login_btn">
        	<button type="button" id="login2" onclick="location.href='/movement'">로그인</button>
          </div>
          <div class="kkt_login_btn">
          <button type="button" id="login3" onclick="location.href='/kakao'"><img src="${pageContext.request.contextPath}/image/main/kakao.png"/></button>
          </div>
          <div>
          	<ul>
				<li><a href="/album">앨범으로 가기</a></li>
			</ul>
          </div>
        </div>
  </body>
  <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous"></script>
  <script>
    const header = document.getElementById("header");
    const navLinks = document.querySelectorAll(".nav-link");

    navLinks.forEach((link) => {
      link.addEventListener("mouseover", () => {
        header.style.backgroundColor = "white";
        navLinks.forEach((link) => {
          link.style.color = "black";
        });
      });

      link.addEventListener("mouseout", () => {
        header.style.backgroundColor = "transparent";
        navLinks.forEach((link) => {
          link.style.color = "white";
        });
      });
    });

    let currentIndex = 0;
    const sections = document.querySelectorAll(".section");
    const totalSections = sections.length;
    const sectionContainer = document.getElementById("sectioncontainer");

    
    document
      .getElementById("nextBtn")
      .addEventListener("click", showNextSection);
    document
      .getElementById("prevBtn")
      .addEventListener("click", showPrevSection);

    function showNextSection() {
      currentIndex = (currentIndex + 1) % totalSections;
      updateCarousel();
    }

    function showPrevSection() {
      currentIndex = (currentIndex - 1 + totalSections) % totalSections;
      updateCarousel();
    }

    function updateCarousel() {
      const offset = -currentIndex * 100;
      sectionContainer.style.transform = "translateX(" + offset + "%)";
    }

    setInterval(showNextSection, 4000);

    document
      .getElementById("scrollLink")
      .addEventListener("click", function (event) {
        event.preventDefault();
        document
          .getElementById("section5")
          .scrollIntoView({ behavior: "smooth" });
      });

    document.addEventListener("DOMContentLoaded", () => {
      const header = document.querySelector("#header");
      const section5 = document.querySelector("#section5");

      const handleScroll = () => {
        const section5Rect = section5.getBoundingClientRect();
        if (section5Rect.top <= 0) {
          header.style.transform = "translateY(-100%)";
        } else {
          header.style.transform = "translateY(0)";
        }
      };

      window.addEventListener("scroll", handleScroll);

      handleScroll();
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
</html>