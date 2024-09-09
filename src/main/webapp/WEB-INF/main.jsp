<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>ForeverCalendar</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/reset.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}css/calander.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}css/tetris.css"
    />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}js/index.global.min.js"></script>
    <script src="${pageContext.request.contextPath}js/tetris.js"></script>
  </head>
  <body>
    <script>
      const currentURL = window.location.href;
      const targetURL = "http://localhost:8080/main";
      if (currentURL === targetURL) {
        localStorage.clear();
      }
    </script>
    <c:if test="${not empty user}">
      <jsp:include page="header.jsp" />
      <c:if test="${check==true}">
        <c:if test="${not empty groupName}">
          <div id="calendar-container">
            <div id="btn-Container">
              <button id="teamBtn">
                <i id="teamUser" class="fa-solid fa-user"></i>
                <h1>${userListSize}</h1>
              </button>
              <button id="teamDelBtn">그룹 삭제</button>
              <script>
                $("#teamDelBtn").click(() => {
                  let groupName = localStorage.getItem("groupName");
                  if (
                    confirm(
                      "삭제하시면 복구할 수 없습니다 \n 정말로 삭제하시겠습니까??"
                    )
                  ) {
                    $.ajax({
                      url: "/deleteGroup",
                      type: "post",
                      data: "groupName=" + groupName,
                      success: function () {
                        window.location.href = "/main";
                      },
                    });
                  } else {
                    return false;
                  }
                });
              </script>
            </div>
            <div id="calendar"></div>
          </div>
        </c:if>
        <c:if test="${empty groupName}">
        <div id="pId1">
        <p>그룹을 선택하세요</p>
        </div>
        <div class="selectOrAdd">
          <canvas></canvas>
          </div>
        </c:if>
      </c:if>
      <c:if test="${check==false}">
        <p class="selectOrAdd">그룹을 생성하세요</p>
        <canvas></canvas>
      </c:if>
      <div id="teamModal" style="display: none">
        <div id="modalContent7">
          <i id="cancelBtn" class="fa-solid fa-x"></i>
          <c:if test="${not empty groupName}">
            <c:forEach items="${userList}" var="smallGroup">
              <div id="users">
                <i id="UserProfile" class="fa-solid fa-user"></i>
                <p id="userCount">${smallGroup.user.id}</p>
              </div>
            </c:forEach>
          </c:if>
        </div>
      </div>
      <div id="bigModal" style="display: none">
        <div id="modalContent3">
          <header class="mdl-header">
            <p class="head-wrd">일정 추가하기</p>
            <i class="fa-solid fa-xmark" id="X"></i>
          </header>
          <!-- <div id="addMemo"><h1>안녕하세요</h1></div> -->
          <div class="modsection" id="addMemo">
            <div id="memoSection">
              <button id="addMemoh1"></button>
            </div>
            <div id="memoSection1">
              여행 시작 :
              <p id="addMemop"></p>
            </div>
            <div id="memoSection2">
              여행 끝 :
              <p id="addMemop2"></p>
            </div>
            <div id="memoSection3">
              여행 경비 :
              <p id="addMemop3"></p>
              원
            </div>
          </div>
          <button class="modsection" id="six">추가</button>
          <button class="modsection" id="seven">앨범</button>
          <button class="modsection" id="eight">삭제</button>
        </div>
      </div>
      <div id="detModal" style="display: none">
        <div id="modalContent4">
          <header class="mdl-header2">
            <p class="head-wrd2">세부 일정 추가</p>
            <i class="fa-solid fa-xmark" id="X2"></i>
          </header>
          <div class="inpt-brder" id="title">
            <i class="fa-solid fa-pencil"></i>
            <input
              type="text"
              placeholder="일정 이름"
              class="tripinfo"
              id="title2"
            />
          </div>
          <div class="inpt-brder">
            <i class="fa-solid fa-plane-departure"></i>
            <input
              type="text"
              placeholder="시작 날짜"
              onfocus="this.type='date'"
              class="tripinfo"
              max="9999-12-31"
              id="startDate"
            />
          </div>
          <div class="inpt-brder">
            <i class="fa-solid fa-plane-arrival"></i>
            <input
              type="text"
              placeholder="종료 날짜"
              onfocus="this.type='date'"
              class="tripinfo"
              max="9999-12-31"
              id="endDate"
            />
          </div>
          <div class="inpt-brder" id="date">
            <i class="fa-solid fa-coins"></i>
            <input
              type="text"
              placeholder="여행 총 경비"
              class="tripinfo"
              id="entireMoney"
            />
          </div>
          <div><button class="submit" id="final">추가하기</button></div>
        </div>
      </div>
      <div id="albumModal" style="display: none">
        <div id="modalContent6">
          <header id="mdl-header3">
            <button id="delete">삭제</button>
            <i class="fa-solid fa-xmark" id="close"></i>
          </header>
          <div id="modalContent5">
            <main id="photoSection">
              <div id="mainImg"></div>
            </main>
          </div>
          <div id="picScroll">
            <button id="slideBtn1" class="slide">&#10094;</button>
            <button id="slideBtn2" class="slide">&#10095;</button>
            <div id="slider"></div>
          </div>
        </div>
      </div>
      <script
        src="https://kit.fontawesome.com/ef885bd654.js"
        crossorigin="anonymous"
      ></script>
      <script>
        $("#final").click(() => {
          $.ajax({
            type: "post",
            url: "/scheduleAdd",
            data: {
              title: $("#title2").val(),
              startDate: $("#startDate").val(),
              endDate: $("#endDate").val(),
              entireMoney: $("#entireMoney").val(),
            },
            success: function (result) {
              alert("추가됐음!");
              const id = $("#title2").val();
              $("#addMemo").html("<button>" + id + "</button>");
              location.reload();
            },
            error: function () {
              alert("다시해라");
              location.reload();
            },
          });
        });
      </script>
      <script>
        $(".add2").click(() => {
          const title = $("#textbox").val().trim();
          const miniTitle = title.substring(0, 2);
          $.ajax({
            type: "post",
            url: "/addGroup",
            data: { groupName: title },
            success: function (response) {
              if (response) {
                $(".group").append(
                  "<button type='button' data-code='" +
                    title +
                    "' class='groupButton' id='" +
                    miniTitle +
                    "'>" +
                    miniTitle +
                    "</button><span>" +
                    title +
                    "</span>"
                );
                // 사용할 앱의 JavaScript 키를 설정해 주세요.
                //$('.modal').css("display", "none");
                window.location.reload();
              } else {
                $("#successText").text("사용할 수 없는 그룹명입니다.");
              }
            },
          });
        });
      </script>
    </c:if>
    <!-- 로그아웃 cif -->
    <c:if test="${empty user}">
      <script>
        alert("로그아웃 처리 되었습니다!");
        window.location.href = "/";
      </script>
    </c:if>
    <script>
      const bigSchedules = [];
      let schedule = {};
      <c:forEach items="${bsList}" var="item">
        schedule.title = "${item.title}";
        schedule.start = "${item.startDate}";
        schedule.end = "${item.endDate}";
        schedule.money = "${item.entireMoney}";
        schedule.color = "${item.scheduleColor}";
        schedule.bsCode = "${item.bsCode}";
        bigSchedules.push(schedule);
        schedule = {};
      </c:forEach>;
      console.log(bigSchedules);
    </script>
    <script src="${pageContext.request.contextPath}/js/calander.js"></script>
  </body>
</html>