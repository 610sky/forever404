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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/semi.css" />
    <script
    src="https://kit.fontawesome.com/ef885bd654.js"
    crossorigin="anonymous"
  ></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  </head>
  <body>
   
  	<c:if test="${not empty user}">
  	<script>
  	window.location.href = "/movement";
  	</script>
  </c:if>
 
  <script>
  Kakao.init('416439531d0e4d8f33eb240c9b791ffb');
  Kakao.Auth.logout();
  </script>
 
    <header id="header">
      <nav id="a1">
      <a href="">
        <h1 class="nav-link">
          Forever
        </h1>
        </a >
        <a href="/"><img src="${pageContext.request.contextPath}/image/main/404.png" /></a>
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

    <div class="main">
      <div id="carousel">
        <button id="prevBtn" class="button2">&#10094;</button>
        <div id="sectioncontainer">
          <section class="section" id="section1">
            <h1>간편하고 체계적인 여행 스케쥴러</h1>
            <h1>SEMI PROJECT　< Trip Scheduler ></h1>
            <h2><a id="scrollLink">자세히 보기</a></h2>
          </section>
          <section class="section" id="section2">
            <h1>실시간으로 일정 공유를</h1>
            <h3>그룹을 생성해 일행들과 계획을 조율해보세요.</h3>
          </section>
          <section class="section" id="section3">
            <h1>체계적인 예산으로</h1>
            <h3>시간 단위로 예산을 설정해 좀 더 계획적인 여행을 즐겨보세요.</h3>
          </section>
          <section class="section" id="section4">
            <h1>어디로 가야할지 고민이신가요?</h1>
            <h3>Trip Scheduler와 연동된 시스템들을 이용해보세요.</h3>
          </section>
        </div>
        <button id="nextBtn" class="button2">&#10095;</button>
      </div>
      <section id="section5">
        <div class=schedule data-aos="fade-down" data-aos-delay="300" data-aos-duration="600">
          <h1>그룹 간 일정 공유를 손쉽게</h1>
          <p>실시간으로 변동되는 일정으로 조율이 간편해요.</p>
        </div>

        <div class="schedule" data-aos="fade-up" data-aos-delay="300" data-aos-duration="800">
          <img src="${pageContext.request.contextPath}/image/mainpage3.png" alt="" />
        </div>
      </section>
      <section id="section6">
        <div id="textBox" data-aos="fade-right"  data-aos-delay="300" data-aos-duration="800">
          <h1>계획을 체계적으로</h1>
          <p>어디로 갈 지 직접 조회하고, 질문하고, 추가해요.<br>
          시간 단위로 여행 경비를 정리할 수 있어요.</p>
          <p></p>
        </div>
        <div id="positionBox">
          <div class="box" id="box1" data-aos="fade-left"  data-aos-delay="300" data-aos-duration="800">
            <img src="${pageContext.request.contextPath}/image/kakaomappage.png" alt="" />
          </div>
          <div class="box" id="box2" data-aos="fade-left"  data-aos-delay="500" data-aos-duration="800">
            <img src="${pageContext.request.contextPath}/image/detailpage3.png" alt="" />
          </div>
        </div>
      </section>
	
      <div class="modal" id="modal">
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
            <img src="${pageContext.request.contextPath}/image/main/kakao.png" alt="카카오 로그인 버튼" />
            </a>
            <script>
            function kakaoLogin() {
            	  window.Kakao.Auth.login({
            	    scope: 'account_email, name, birthyear, phone_number, birthday',
            	    success: function(authObj) {
            	      const accessToken = authObj.access_token;
            	      Kakao.Auth.setAccessToken(accessToken);

            	      window.Kakao.API.request({
            	        url: '/v2/user/me',
            	        success: function(res) {
            	          const kakao_account = res.kakao_account;
            	          const  birthday = kakao_account.birthday;
            	          const formData = {
            	            email: kakao_account.email,
            	            name: kakao_account.name,
            	            birthday: kakao_account.birthday,
            	            birthyear: kakao_account.birthyear,
            	            phone: kakao_account.phone_number,
            	            token: accessToken
            	          };
						
            	          // jQuery AJAX 요청
            	          $.ajax({
            	            url: '/kakaoLogin',
            	            method: 'POST',
            	            data: formData,
            	            success: function(response) {
            	              // 요청이 성공했을 때 수행할 작업
            	              
            	            	window.location.href = '/main';
            	              	location.reload();
            	            },
            	            error: function(jqXHR, textStatus, errorThrown) {
            	              // 요청이 실패했을 때 수행할 작업
            	              console.error('Login failed: ', textStatus, errorThrown);
            	            }
            	          });
            	        }
            	      });
            	    },
            	    fail: function(error) {
            	      console.error('Kakao login failed: ', error);
            	    }
            		
            	  });
            	}
            </script>
          </div>
        </div>
      </div>
      
   
	<script>
		$("#login2").click(() => {
			$.ajax({
				type : "post",
				url : "/login",
				data : {
					id: $("#id").val(),
					password: $("#password").val()
				},
				success : function(response) {
					if(response == true) {
					  	window.location.href = "/movement";
						location.reload();
					}else {
						alert("아이디 혹은 비밀번호가 잘못되었습니다");
					}
				}
			})
		});
	</script>
  </body>
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
    
    AOS.init();
  </script>
  

</html>