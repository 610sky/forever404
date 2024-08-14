<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail2.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&family=Nanum+Gothic:wght@400;700&display=swap"
      rel="stylesheet"
    />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  </head>
  <body>
    <header>
      <div id="group"><button type="text">그룹</button></div>
      <section id="date">
        <h1>2024-08-05</h1>
      </section>
    </header>

    <main>
      <section class="section1">
        <div id="pay">
          <p>남은금액 : 300,000원</p>
          <br />
          <p>총 지불금액 : 250,000원</p>
          <br />
          <p>지불품목 : 바닐라라떼, 케이크</p>
          <br />
          <p>사용금액 : 50,000원</p>
        </div>
      </section>
      <div id="time1" class="time"><p>09:00</p></div>
      <button id="nextBtn1" class="button1">&#10095;</button>

      <div class="sectioncontainer">
        <section class="section">
          <div class="img">image</div>
          <div>
            <div class="title"><h2>타이틀</h2></div>
            <p>위치</p>
            <p>영업시간</p>
          </div>
        </section>
      </div>
      <section class="section">
        <div class="img">image</div>
        <div>
          <h2>타이틀</h2>
          <p>위치</p>
          <p>영업시간</p>
        </div>
      </section>
      <button id="nextBtn2" class="button2">&#10094;</button>

      <section class="time" id="time2">
        <div><p>18:00</p></div>
      </section>
    </main>

    <section id="btncontainer">
      <button id="button3" class="btn1">일정 추가</button>
      <button id="button4" class="btn1">사진 추가</button>
      <button id="button5" class="btn1">지불 품목</button>
      <button id="plus" class="btn">
        <i class="bi bi-plus-circle-fill"></i>
      </button>
    </section>

    <div id="modal1" class="modal">
      <div class="modalcontent">
        <span class="close">&times</span>
        <h2>일정 추가</h2>
        <hr />
        <div class="ps">
          <p>시작시간 :</p>
          <select id="start">
            <option value="09:00">09:00</option>
            <option value="10:00">10:00</option>
          </select>
        </div>
        <div class="ps">
          <p>종료시간 :</p>
          <select id="finish">
            <option value="09:00">18:00</option>
            <option value="10:00">19:00</option>
          </select>
        </div>
        <div class="ps">
          <p>위치 :</p>
          <input type="text" />
        </div>
        <div class="ps">
          <p>영업시간 :</p>
          <input type="text" />
        </div>
        <div class="add">
          <button id="schedule" class="add2">추가</button>
        </div>
      </div>
    </div>

    <div id="modal2" class="modal">
      <div class="modalcontent">
        <span class="close">&times</span>
        <h2>사진 추가</h2>
        <hr />
        <p>213</p>
        <p>456</p>
        <div class="add">
          <button class="add2">추가</button>
        </div>
      </div>
    </div>

    <div id="modal3" class="modal">
      <div class="modalcontent">
        <span class="close">&times</span>
        <h2>지불 품목</h2>
        <hr />
        지불 품목 : <input type="text" class="money" /> <br />
        사용 금액 :
        <input type="text" class="money" />
        <div class="add">
          <button class="add2">추가</button>
        </div>
      </div>
    </div>

    <script>
      $(".btn").click((e) => {
        let content = $(".btn1");

        if (content.css("display") === "none") {
          content.slideDown(150);
        } else {
          content.slideUp(150);
        }
      });
      $(window).resize(() => {
        let content = $(".btn1");
        if ($(window).width() < 1200) {
          content.slideUp(150);
        }
      });

      $("#button3").click(function () {
        $("#modal1").css("display", "block");
      });

      $(".close").click(function () {
        $(".modal").css("display", "none");
      });

      $(window).click(function (event) {
        if ($(event.target).is(".modal")) {
          $(".modal").css("display", "none");
        }
      });

      $(document).keydown(function (event) {
        if (event.keyCode == 27) {
          $(".modal").css("display", "none");
        }
      });

      $("#button4").click(function () {
        $("#modal2").css("display", "block");
      });

      $("#button5").click(function () {
        $("#modal3").css("display", "block");
      });

      // $("#schedule").click(function () {
      // $(".section").show().css("display", "block");
      // });
    </script>
  </body>
</html>
